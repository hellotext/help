# frozen_string_literal: true

# Scrub the one non-demo contact lineage from a COPY of the editorial database.
# Default mode performs SELECTs inside a READ ONLY transaction and makes no edits.
# Apply only after reviewing the clone and setting:
#   WORKLOAD_SCRUB_APPLY=YES_ISOLATED_CLONE_ONLY ruby this-file.rb
# Never point this script at the source database or a database used by a server.

require 'pg'

module EditorialWorkloadCloneScrub
  DATABASE = 'hellotext_editorial_workload_20260928'
  BUSINESS_ID = 5
  APPLY_TOKEN = 'YES_ISOLATED_CLONE_ONLY'
  DEMO_FLAG = '{"design_system_report_fixture":true}'

  DIRECT_REFERENCES = {
    ['attribution_revenues', 'contact_id'] => 19,
    ['messages', 'contact_id'] => 1,
    ['properties', 'contact_id'] => 1,
    ['track_events', 'contact_id'] => 19,
    ['track_revenues', 'contact_id'] => 3,
  }.freeze

  DESCENDANT_REFERENCES = {
    ['attribution_revenues', 'attribution_allocations', 'attribution_revenue_id'] => 3,
    ['attribution_revenues', 'attribution_segments', 'attribution_revenue_id'] => 18,
    ['attribution_revenues', 'track_revenues', 'attribution_revenue_id'] => 3,
    ['conversations', 'events', 'conversation_id'] => 1,
    ['track_events', 'attribution_revenues', 'event_id'] => 19,
    ['track_events', 'track_revenues', 'event_id'] => 3,
    ['track_revenues', 'attribution_allocations', 'track_revenue_id'] => 3,
  }.freeze

  PARENT_TABLES = %w[
    attribution_revenues conversations messages properties track_events track_revenues
  ].freeze

  def self.count(connection, sql, *binds)
    connection.exec_params(sql, binds).first.fetch('count').to_i
  end

  def self.expect(label, actual, expected)
    raise "#{label}: expected #{expected}, got #{actual}" unless actual == expected
  end

  def self.assert_database(connection)
    row = connection.exec('SELECT current_database() AS database, inet_server_addr()::text AS address').first
    raise 'Wrong database' unless row.fetch('database') == DATABASE
    raise 'Expected local Unix socket' unless row.fetch('address').nil?
    expect('business identity', count(connection, <<~SQL, BUSINESS_ID), 1)
      SELECT count(*) FROM businesses
      WHERE id=$1 AND handle='hellotext' AND name='Enterprise'
        AND state='active' AND timezone='Montevideo'
        AND metadata->>'report_development_samples'='false'
    SQL
  end

  def self.assert_workload_baseline(connection)
    windows = {
      previous: ['2026-08-28 00:00:00-03', '2026-09-11 00:00:00-03'],
      current: ['2026-09-11 00:00:00-03', '2026-09-25 00:00:00-03'],
    }
    windows.each do |period, (from, to)|
      %w[workload_sessions workload_handles].each do |table|
        actual = count(connection,
          "SELECT count(*) FROM #{table} WHERE business_id=$1 AND started_at >= $2::timestamptz AND started_at < $3::timestamptz",
          BUSINESS_ID, from, to)
        expect("#{period} #{table}", actual, table == 'workload_sessions' ? 56 : 224)
      end
    end
  end

  def self.references_to_contact(connection, contact_id)
    rows = connection.exec(<<~SQL)
      SELECT child.relname AS table_name, attribute.attname AS column_name
      FROM pg_constraint foreign_key
      JOIN pg_class parent ON parent.oid=foreign_key.confrelid
      JOIN pg_class child ON child.oid=foreign_key.conrelid
      JOIN pg_attribute attribute ON attribute.attrelid=child.oid AND attribute.attnum=foreign_key.conkey[1]
      JOIN pg_namespace namespace ON namespace.oid=child.relnamespace
      WHERE foreign_key.contype='f' AND parent.relname='contacts'
        AND namespace.nspname='public' AND array_length(foreign_key.conkey,1)=1
    SQL
    rows.each_with_object({}) do |row, result|
      table = PG::Connection.quote_ident(row.fetch('table_name'))
      column = PG::Connection.quote_ident(row.fetch('column_name'))
      actual = count(connection, "SELECT count(*) FROM #{table} WHERE #{column}=$1", contact_id)
      result[[row.fetch('table_name'), row.fetch('column_name')]] = actual if actual.positive?
    end
  end

  def self.assert_reference_graph(connection, contact_id)
    expect('contact foreign-key references', references_to_contact(connection, contact_id), DIRECT_REFERENCES)

    quoted_names = PARENT_TABLES.map { |name| connection.escape_string(name) }.map { |name| "'#{name}'" }.join(',')
    rows = connection.exec(<<~SQL)
      SELECT parent.relname AS parent_name, child.relname AS child_name, attribute.attname AS child_column
      FROM pg_constraint foreign_key
      JOIN pg_class parent ON parent.oid=foreign_key.confrelid
      JOIN pg_class child ON child.oid=foreign_key.conrelid
      JOIN pg_attribute attribute ON attribute.attrelid=child.oid AND attribute.attnum=foreign_key.conkey[1]
      JOIN pg_namespace namespace ON namespace.oid=child.relnamespace
      WHERE foreign_key.contype='f' AND parent.relname IN (#{quoted_names})
        AND namespace.nspname='public' AND array_length(foreign_key.conkey,1)=1
    SQL
    references = rows.each_with_object({}) do |row, result|
      parent = PG::Connection.quote_ident(row.fetch('parent_name'))
      child = PG::Connection.quote_ident(row.fetch('child_name'))
      column = PG::Connection.quote_ident(row.fetch('child_column'))
      actual = count(connection,
        "SELECT count(*) FROM #{child} child JOIN #{parent} parent ON child.#{column}=parent.id WHERE parent.contact_id=$1",
        contact_id)
      result[[row.fetch('parent_name'), row.fetch('child_name'), row.fetch('child_column')]] = actual if actual.positive?
    end
    expect('descendant foreign-key references', references, DESCENDANT_REFERENCES)

    expect('event used as last event', count(connection, <<~SQL, contact_id), 1)
      SELECT count(*) FROM conversations conversation
      JOIN events event ON event.id=conversation.last_event_id
      WHERE conversation.contact_id=$1
    SQL
    expect('allocation engine runs', count(connection, <<~SQL, contact_id), 0)
      SELECT count(*) FROM attribution_engine_runs run
      JOIN attribution_allocations allocation ON allocation.id=run.allocation_id
      JOIN attribution_revenues revenue ON revenue.id=allocation.attribution_revenue_id
      WHERE revenue.contact_id=$1
    SQL
  end

  def self.assert_preflight(connection)
    assert_database(connection)
    assert_workload_baseline(connection)
    expect('business contact count', count(connection, 'SELECT count(*) FROM contacts WHERE business_id=$1', BUSINESS_ID), 117)
    expect('safe demo contacts', count(connection, <<~SQL, BUSINESS_ID, DEMO_FLAG), 116)
      SELECT count(*) FROM contacts WHERE business_id=$1 AND metadata @> $2::jsonb
        AND subscription_state='unconfirmed' AND messageable=false
    SQL
    contact_rows = connection.exec_params(<<~SQL, [BUSINESS_ID, DEMO_FLAG])
      SELECT id FROM contacts WHERE business_id=$1 AND NOT metadata @> $2::jsonb
    SQL
    expect('non-demo contact count', contact_rows.ntuples, 1)
    contact_id = contact_rows.first.fetch('id').to_i
    expect('non-demo deliverable contact', count(connection, <<~SQL, contact_id), 1)
      SELECT count(*) FROM contacts WHERE id=$1 AND (messageable OR subscription_state<>'unconfirmed')
    SQL

    {
      conversations: 1,
      messages: 1,
      properties: 1,
      track_events: 19,
      track_revenues: 3,
      attribution_revenues: 19,
      contact_interactions: 0,
    }.each do |table, expected|
      expect("contact #{table}", count(connection, "SELECT count(*) FROM #{table} WHERE contact_id=$1", contact_id), expected)
    end
    expect('Action Text message bodies', count(connection, <<~SQL, contact_id), 1)
      SELECT count(*) FROM action_text_rich_texts body
      JOIN messages message ON body.record_type='Message' AND body.record_id=message.id
      WHERE message.contact_id=$1
    SQL
    expect('message attachments', count(connection, <<~SQL, contact_id), 0)
      SELECT count(*) FROM active_storage_attachments attachment
      JOIN messages message ON attachment.record_type='Message' AND attachment.record_id=message.id
      WHERE message.contact_id=$1
    SQL
    expect('conversation events', count(connection, <<~SQL, contact_id), 1)
      SELECT count(*) FROM events event JOIN conversations conversation ON conversation.id=event.conversation_id
      WHERE conversation.contact_id=$1
    SQL
    %w[workload_handles workload_user_intervals workload_team_intervals].each do |table|
      expect("private conversation #{table}", count(connection, <<~SQL, contact_id), 0)
        SELECT count(*) FROM #{table} workload
        JOIN conversations conversation ON conversation.id=workload.conversation_id
        WHERE conversation.contact_id=$1
      SQL
    end
    assert_reference_graph(connection, contact_id)
    contact_id
  end

  def self.change(connection, sql, contact_id, expected)
    actual = connection.exec_params(sql, [contact_id]).cmd_tuples
    expect('scrub write row count', actual, expected)
  end

  def self.apply(connection, contact_id)
    change(connection, <<~SQL, contact_id, 3)
      DELETE FROM attribution_allocations
      WHERE attribution_revenue_id IN (SELECT id FROM attribution_revenues WHERE contact_id=$1)
         OR track_revenue_id IN (SELECT id FROM track_revenues WHERE contact_id=$1)
    SQL
    change(connection, <<~SQL, contact_id, 18)
      DELETE FROM attribution_segments
      WHERE attribution_revenue_id IN (SELECT id FROM attribution_revenues WHERE contact_id=$1)
    SQL
    change(connection, 'DELETE FROM track_revenues WHERE contact_id=$1', contact_id, 3)
    change(connection, 'DELETE FROM attribution_revenues WHERE contact_id=$1', contact_id, 19)
    change(connection, 'DELETE FROM track_events WHERE contact_id=$1', contact_id, 19)
    change(connection, 'DELETE FROM properties WHERE contact_id=$1', contact_id, 1)
    change(connection, <<~SQL, contact_id, 1)
      DELETE FROM action_text_rich_texts
      WHERE record_type='Message' AND record_id IN (SELECT id FROM messages WHERE contact_id=$1)
    SQL
    change(connection, 'UPDATE conversations SET last_event_id=NULL WHERE contact_id=$1', contact_id, 1)
    change(connection, <<~SQL, contact_id, 1)
      DELETE FROM events WHERE conversation_id IN (SELECT id FROM conversations WHERE contact_id=$1)
    SQL
    change(connection, 'DELETE FROM messages WHERE contact_id=$1', contact_id, 1)
    change(connection, 'DELETE FROM conversations WHERE contact_id=$1', contact_id, 1)
    change(connection, 'DELETE FROM contacts WHERE id=$1', contact_id, 1)
  end

  def self.assert_scrubbed(connection, contact_id)
    assert_database(connection)
    assert_workload_baseline(connection)
    expect('remaining business contacts', count(connection, 'SELECT count(*) FROM contacts WHERE business_id=$1', BUSINESS_ID), 116)
    expect('remaining demo contacts', count(connection, <<~SQL, BUSINESS_ID, DEMO_FLAG), 116)
      SELECT count(*) FROM contacts WHERE business_id=$1 AND metadata @> $2::jsonb
        AND subscription_state='unconfirmed' AND messageable=false
    SQL
    expect('remaining non-demo contacts', count(connection, <<~SQL, BUSINESS_ID, DEMO_FLAG), 0)
      SELECT count(*) FROM contacts WHERE business_id=$1 AND NOT metadata @> $2::jsonb
    SQL
    expect('remaining deliverable contacts', count(connection, <<~SQL, BUSINESS_ID), 0)
      SELECT count(*) FROM contacts WHERE business_id=$1
        AND (messageable OR subscription_state<>'unconfirmed')
    SQL
    expect('remaining assigned conversations', count(connection, "SELECT count(*) FROM conversations WHERE business_id=$1 AND state='assigned'", BUSINESS_ID), 0)
    %w[contacts conversations messages properties track_events track_revenues attribution_revenues contact_interactions].each do |table|
      expect("scrubbed #{table}", count(connection, "SELECT count(*) FROM #{table} WHERE contact_id=$1", contact_id), 0) unless table == 'contacts'
    end
    expect('scrubbed contact row', count(connection, 'SELECT count(*) FROM contacts WHERE id=$1', contact_id), 0)
  end

  def self.run
    requested = ENV['WORKLOAD_SCRUB_APPLY']
    raise 'Invalid apply token' if requested && requested != APPLY_TOKEN

    connection = PG.connect(dbname: DATABASE, host: '/tmp')
    connection.transaction do
      connection.exec('SET TRANSACTION READ ONLY')
      connection.exec("SET LOCAL lock_timeout='3s'")
      contact_id = assert_preflight(connection)
      puts "preflight=ok database=#{DATABASE} non_demo_lineages=1 read_only=true"
      puts 'dry_run=true apply_token_required=true' unless requested
    end

    return unless requested

    connection.transaction do
      connection.exec("SET LOCAL lock_timeout='3s'")
      connection.exec("SET LOCAL statement_timeout='30s'")
      contact_id = assert_preflight(connection)
      apply(connection, contact_id)
      assert_scrubbed(connection, contact_id)
    end
    puts "scrubbed=true database=#{DATABASE} business_id=#{BUSINESS_ID}"
  ensure
    connection&.close
  end
end

EditorialWorkloadCloneScrub.run
