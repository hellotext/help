# Local, opt-in source data for the Workload and capacity Help screenshots.
# Run through `bin/rails runner` from a Rails checkout containing PR #6010.
# Dry run is the default. This file never invokes delivery, routing, jobs, or
# model create/update callbacks; all fixture writes use direct SQL insert APIs.

class EditorialWorkloadVisualFixture
  EXPECTED_DATABASE = 'hellotext_editorial_workload_20260928'
  BUSINESS_ID = 5
  PREFIX = 'editorial_workload_20260928_'
  APPLY_TOKEN = 'YES_ISOLATED_DEMO_ONLY'
  FROM = Date.new(2026, 9, 11)
  TO = Date.new(2026, 9, 24)
  PRESSURE_DAYS = [Date.new(2026, 9, 12), Date.new(2026, 9, 17), Date.new(2026, 9, 23)]
  LOW_DAYS = (FROM..TO).to_a
  TEAM_NAMES = ['Atención · Demo reportes', 'Ventas · Demo reportes']
  PEOPLE = {
    low_a: { first_name: 'Lucía', last_name: 'Demo carga', capacity: 3, team: TEAM_NAMES[0] },
    low_b: { first_name: 'Mateo', last_name: 'Demo carga', capacity: 3, team: TEAM_NAMES[1] },
    high: { first_name: 'Sara', last_name: 'Demo carga', capacity: 2, team: TEAM_NAMES[1] },
    watch: { first_name: 'Tomás', last_name: 'Demo carga', capacity: 2, team: TEAM_NAMES[0] },
  }
  CONVERSATION_KEYS = [
    *4.times.map { |index| "low_a_#{index}" },
    *4.times.map { |index| "low_b_#{index}" },
    'high_0', 'high_1', 'watch_0',
  ]
  EXPECTED_COUNTS = {
    users: 4,
    privileges: 4,
    contacts: 11,
    conversations: 11,
    sessions: 34,
    handles: 37,
    user_intervals: 15,
    team_intervals: 15,
    messages: 1,
    sla_cycles: 1,
  }

  def self.run
    new.run
  end

  def initialize
    @connection = ActiveRecord::Base.connection
    @now = Time.current
    @users = {}
    @privileges = {}
    @teams = {}
    @conversations = {}
    @handles_by_conversation = Hash.new { |hash, key| hash[key] = [] }
  end

  def run
    guard_environment
    guard_business
    guard_sources

    if fixture_present?
      verify_inserted
      verify_report
      puts "already_applied=true database=#{EXPECTED_DATABASE} fixture=#{PREFIX}"
      return
    end

    guard_baseline
    puts "preflight=ok database=#{EXPECTED_DATABASE} business_id=#{BUSINESS_ID} period=#{FROM}..#{TO} planned=#{EXPECTED_COUNTS}"
    unless ENV['EDITORIAL_FIXTURE_APPLY'] == APPLY_TOKEN
      puts "dry_run=true; set EDITORIAL_FIXTURE_APPLY=#{APPLY_TOKEN} only after reviewing this fixture"
      return
    end

    ApplicationRecord.transaction do
      guard_baseline
      insert_people
      insert_conversations
      insert_workload
      insert_ownership
      insert_current_sla
      verify_inserted
      verify_report
    end

    puts "applied=true database=#{EXPECTED_DATABASE} fixture=#{PREFIX}"
  end

  private
    def guard_environment
      raise 'Development only' unless Rails.env.development?
      raise 'Wrong database configuration' unless ActiveRecord::Base.connection_db_config.database == EXPECTED_DATABASE
      raise 'Wrong active database' unless @connection.select_value('SELECT current_database()') == EXPECTED_DATABASE

      server_address = @connection.select_value('SELECT inet_server_addr()::text')
      raise 'Database is not local' unless server_address.nil? || %w[127.0.0.1 ::1].include?(server_address)
      raise 'Report widget samples must be disabled' unless ENV['REPORT_WIDGET_SAMPLES'] == '0'
      raise 'The selected period must be complete' unless Date.current > TO
    end

    def guard_business
      @business = Business.find(BUSINESS_ID)
      raise 'Wrong demonstration business' unless @business.handle == 'hellotext' && @business.name == 'Enterprise'
      raise 'Business is not active' unless @business.kept? && @business.state == 'active'
      raise 'Wrong business timezone' unless @business.timezone == 'Montevideo'
      raise 'Report samples are enabled' unless @business.metadata['report_development_samples'] == false

      @zone = Time.find_zone!(@business.timezone)
    end

    def guard_sources
      source_contacts = Contact
        .where(business_id: BUSINESS_ID)
        .where('metadata @> ?', { design_system_report_fixture: true }.to_json)
        .where("COALESCE(metadata ->> 'fixture_key', '') NOT LIKE ?", "#{PREFIX}%")
      raise 'Unexpected source contact population' unless source_contacts.count == 116
      raise 'A source contact is deliverable' unless source_contacts.where(subscription_state: :unconfirmed, messageable: false).count == 116
      raise 'An automation is active' if Automation::Workflow.where(business_id: BUSINESS_ID).where.not(state: 'disabled').exists?
      raise 'A channel is active' if Channel.where(business_id: BUSINESS_ID).where.not(status: 'inactive').exists?
      raise 'A playbook is enabled' if Playbook.where(business_id: BUSINESS_ID, enabled: true).exists?

      TEAM_NAMES.each do |name|
        @teams[name] = Team.kept.where(business_id: BUSINESS_ID, name:).sole
      end

      @channel = Channel
        .joins('INNER JOIN playbooks ON playbooks.id = channels.channable_id AND channels.channable_type = \'Playbook\'')
        .joins('INNER JOIN technologies ON technologies.id = channels.technology_id')
        .where(business_id: BUSINESS_ID, status: 'inactive', playbooks: { type: 'Playbook::Webchat', enabled: false }, technologies: { name: 'Webchat' })
        .sole
      @sla_rule = SLA::Rule.where(business_id: BUSINESS_ID, kind: 'default', discarded_at: nil).sole
      raise 'Invalid first-response target' unless @sla_rule.first_response_target_seconds.positive?
    end

    def guard_baseline
      raise 'Unexpected total contact population' unless Contact.where(business_id: BUSINESS_ID).count == 116
      previous_from = @zone.local(2026, 8, 28)
      previous_to = @zone.local(2026, 9, 11)
      current_from = @zone.local(2026, 9, 11)
      current_to = @zone.local(2026, 9, 25)

      raise 'Previous sessions changed' unless Workload::Session.where(business_id: BUSINESS_ID, started_at: previous_from...previous_to).count == 56
      raise 'Current sessions changed' unless Workload::Session.where(business_id: BUSINESS_ID, started_at: current_from...current_to).count == 56
      raise 'Previous handles changed' unless Workload::Handle.where(business_id: BUSINESS_ID, started_at: previous_from...previous_to).count == 224
      raise 'Current handles changed' unless Workload::Handle.where(business_id: BUSINESS_ID, started_at: current_from...current_to).count == 224
      raise 'An existing report fixture is present' if fixture_present?
    end

    def fixture_present?
      fixture_user_emails = PEOPLE.keys.map { |key| email_for(key) }
      User.where(email: fixture_user_emails).exists? ||
        Contact.where(business_id: BUSINESS_ID).where("metadata ->> 'fixture_key' LIKE ?", "#{PREFIX}%").exists? ||
        Conversation.where(business_id: BUSINESS_ID).where("metadata ->> 'fixture_key' LIKE ?", "#{PREFIX}%").exists? ||
        Message.where(business_id: BUSINESS_ID).where("metadata ->> 'fixture_key' LIKE ?", "#{PREFIX}%").exists?
    end

    def insert_people
      PEOPLE.each do |key, profile|
        user = insert_one(User,
          email: email_for(key),
          first_name: profile.fetch(:first_name),
          last_name: profile.fetch(:last_name),
          locale: 'es',
          timezone: @business.timezone,
          utm: {})
        privilege = insert_one(Privilege,
          business_id: BUSINESS_ID,
          user_id: user.id,
          role: 'agent',
          inbox_capacity_mode: 'custom',
          max_concurrent_conversations: profile.fetch(:capacity),
          daily_handling_minutes: 360)
        @users[key] = user
        @privileges[key] = privilege
      end
    end

    def insert_conversations
      CONVERSATION_KEYS.each do |key|
        contact = insert_one(Contact,
          business_id: BUSINESS_ID,
          first_name: "Caso #{key.tr('_', ' ')}",
          last_name: 'Demo carga',
          display_name: "Caso #{key.tr('_', ' ')} · Demo carga",
          state: 'active',
          subscription_state: 'unconfirmed',
          messageable: false,
          metadata: fixture_metadata("contact_#{key}"))
        current_wait = key == 'high_0'
        @conversations[key] = insert_one(Conversation,
          business_id: BUSINESS_ID,
          contact_id: contact.id,
          state: current_wait ? 'assigned' : 'closed',
          assigned_user_id: current_wait ? @users.fetch(:high).id : nil,
          state_changed_at: @now,
          metadata: fixture_metadata("conversation_#{key}"))
      end
    end

    def insert_workload
      LOW_DAYS.each_with_index do |day, index|
        %i[low_a low_b].each do |person|
          session = insert_session(person:, day:, hours: 5)
          group = index * 4 / LOW_DAYS.size
          key = "#{person}_#{group}"
          insert_handle(person:, session:, key:, from: session.started_at + 30.minutes, to: session.started_at + 60.minutes)
        end
      end

      PRESSURE_DAYS.each do |day|
        high_session = insert_session(person: :high, day:, hours: 6)
        %w[high_0 high_1].each do |key|
          insert_handle(person: :high, session: high_session, key:, from: high_session.started_at, to: high_session.ended_at)
        end
        watch_session = insert_session(person: :watch, day:, hours: 6)
        insert_handle(person: :watch, session: watch_session, key: 'watch_0', from: watch_session.started_at, to: watch_session.started_at + 4.5.hours)
      end
    end

    def insert_session(person:, day:, hours:)
      profile = PEOPLE.fetch(person)
      start_at = @zone.local(day.year, day.month, day.day, 9)
      end_at = start_at + hours.hours
      insert_one(Workload::Session,
        business_id: BUSINESS_ID,
        user_id: @users.fetch(person).id,
        privilege_id: @privileges.fetch(person).id,
        started_at: start_at,
        last_seen_at: end_at,
        ended_at: end_at,
        ended_reason: 'logout',
        role_snapshot: 'agent',
        max_concurrent_conversations_snapshot: profile.fetch(:capacity),
        daily_handling_minutes_snapshot: 360,
        session_timeout_seconds_snapshot: 900)
    end

    def insert_handle(person:, session:, key:, from:, to:)
      insert_one(Workload::Handle,
        business_id: BUSINESS_ID,
        user_id: @users.fetch(person).id,
        privilege_id: @privileges.fetch(person).id,
        conversation_id: @conversations.fetch(key).id,
        workload_session_id: session.id,
        started_at: from,
        last_touched_at: to,
        ended_at: to,
        ended_reason: 'session_ended',
        start_source: 'note',
        last_source: 'note',
        handle_idle_timeout_seconds_snapshot: 300)
      @handles_by_conversation[key] << { from:, to: }
    end

    def insert_ownership
      CONVERSATION_KEYS.each do |key|
        person = person_for(key)
        times = @handles_by_conversation.fetch(key)
        from = times.map { |time| time.fetch(:from) }.min - 5.minutes
        to = key == 'high_0' ? nil : times.map { |time| time.fetch(:to) }.max + 5.minutes
        team = @teams.fetch(PEOPLE.fetch(person).fetch(:team))

        if person == :low_b
          previous_from = from - 15.minutes
          insert_one(Workload::UserInterval,
            business_id: BUSINESS_ID,
            conversation_id: @conversations.fetch(key).id,
            user_id: @users.fetch(:low_a).id,
            previous_user_id: nil,
            assignment_source: 'routing',
            started_at: previous_from,
            ended_at: from)
          insert_one(Workload::TeamInterval,
            business_id: BUSINESS_ID,
            conversation_id: @conversations.fetch(key).id,
            team_id: @teams.fetch(PEOPLE.fetch(:low_a).fetch(:team)).id,
            assignment_source: 'routing',
            started_at: previous_from,
            ended_at: from)
        end

        insert_one(Workload::UserInterval,
          business_id: BUSINESS_ID,
          conversation_id: @conversations.fetch(key).id,
          user_id: @users.fetch(person).id,
          previous_user_id: person == :low_b ? @users.fetch(:low_a).id : nil,
          assignment_source: person == :low_b ? 'manual' : 'routing',
          started_at: from,
          ended_at: to)
        insert_one(Workload::TeamInterval,
          business_id: BUSINESS_ID,
          conversation_id: @conversations.fetch(key).id,
          team_id: team.id,
          assignment_source: person == :low_b ? 'manual' : 'routing',
          started_at: from,
          ended_at: to)
      end
    end

    def insert_current_sla
      conversation = @conversations.fetch('high_0')
      # The schema requires a started_by_message_id. This received-only row is
      # an inert foreign-key reference, not an outbound or customer-visible send.
      message = insert_one(Message,
        business_id: BUSINESS_ID,
        contact_id: conversation.contact_id,
        channel_id: @channel.id,
        technology_id: @channel.technology_id,
        state: 'received',
        source_type: PREFIX,
        source_id: BUSINESS_ID.to_s,
        metadata: fixture_metadata('waiting_reference'))
      deadline_at = @now - 15.minutes
      target_seconds = @sla_rule.first_response_target_seconds
      cycle = insert_one(SLA::Cycle,
        business_id: BUSINESS_ID,
        conversation_id: conversation.id,
        sla_rule_id: @sla_rule.id,
        channel_id: @channel.id,
        technology_id: @channel.technology_id,
        kind: 'first_response',
        state: 'breached',
        started_by_message_id: message.id,
        starting_assigned_user_id: @users.fetch(:high).id,
        started_at: deadline_at - target_seconds.seconds,
        deadline_at:,
        target_seconds:,
        breached_at: deadline_at)
      conversation.update_columns(current_sla_cycle_id: cycle.id)
    end

    def verify_inserted
      users = User.where(email: PEOPLE.keys.map { |key| email_for(key) })
      contacts = fixture_scope(Contact)
      conversations = fixture_scope(Conversation)
      messages = fixture_scope(Message)
      user_ids = users.ids
      conversation_ids = conversations.ids
      actual = {
        users: users.count,
        privileges: Privilege.where(business_id: BUSINESS_ID, user_id: user_ids, discarded_at: nil).count,
        contacts: contacts.count,
        conversations: conversations.count,
        sessions: Workload::Session.where(business_id: BUSINESS_ID, user_id: user_ids).count,
        handles: Workload::Handle.where(business_id: BUSINESS_ID, user_id: user_ids).count,
        user_intervals: Workload::UserInterval.where(business_id: BUSINESS_ID, conversation_id: conversation_ids).count,
        team_intervals: Workload::TeamInterval.where(business_id: BUSINESS_ID, conversation_id: conversation_ids).count,
        messages: messages.count,
        sla_cycles: SLA::Cycle.where(business_id: BUSINESS_ID, conversation_id: conversation_ids).count,
      }
      raise "Incomplete or altered fixture: #{actual}" unless actual == EXPECTED_COUNTS
      raise 'A fixture contact became deliverable' unless contacts.where(subscription_state: :unconfirmed, messageable: false).count == EXPECTED_COUNTS.fetch(:contacts)
      raise 'Unexpected total contact population' unless Contact.where(business_id: BUSINESS_ID).count == 127
      raise 'A fixture message is dispatchable' unless messages.where(state: :received, destination_id: nil, dispatched_at: nil).count == 1
      raise 'A fixture message acquired a body' if messages.first.body.present?
      raise 'A fixture session remains open' if Workload::Session.where(business_id: BUSINESS_ID, user_id: user_ids, ended_at: nil).exists?
      raise 'A fixture handle remains open' if Workload::Handle.where(business_id: BUSINESS_ID, user_id: user_ids, ended_at: nil).exists?

      current = conversations.find_by!(metadata: fixture_metadata('conversation_high_0'))
      cycle = SLA::Cycle.find_by!(business_id: BUSINESS_ID, conversation_id: current.id)
      raise 'Current SLA fixture is incomplete' unless current.state == 'assigned' && current.assigned_user_id.in?(user_ids) && current.current_sla_cycle_id == cycle.id && cycle.breached? && cycle.responded_at.nil?
    end

    def verify_report
      report = Report.find_by!(identifier: :workload_and_capacity)
      picker = Report::DatePicker.new(params: { preset: 'custom', from: FROM.iso8601, to: TO.iso8601 })
      previous = picker.previous_period
      report.metrics.each do |metric|
        current_payload = metric.calculator(report:, business: @business, from: picker.from, to: picker.to).run
        previous_payload = metric.calculator(report:, business: @business, from: previous.fetch(:from), to: previous.fetch(:to)).run
        comparison = Report::Metric::Comparison.new(metric:, current_payload:, previous_payload:)
        raise "Unfavorable or absent #{metric.identifier} comparison" unless comparison.data? && comparison.favorable?
      end

      capacity = Report::Widget::CapacityPressure.new(report:, business: @business, from: picker.from, to: picker.to).data.fetch(:items)
      efficiency = Report::Widget::SessionEfficiency.new(report:, business: @business, from: picker.from, to: picker.to).data.fetch(:items)
      raise 'Capacity pressure widget is sparse' unless capacity.count { |item| item.fetch(:raw).positive? && item.fetch(:total).positive? } >= 4
      raise 'Session efficiency widget is sparse' unless efficiency.count { |item| item.fetch(:raw).positive? && item.fetch(:total).positive? } >= 4

      rows = Report::Section::OperationalPressure.new(business: @business, from: picker.from, to: picker.to).rows
      expected_states = { low_a: 'normal', low_b: 'normal', high: 'at_risk', watch: 'watch' }
      expected_states.each do |person, state|
        user_id = User.find_by!(email: email_for(person)).id
        row = rows.find { |candidate| candidate.object.id == user_id }
        raise "Wrong #{person} pressure state" unless row&.burn_state == state
      end
      high_id = User.find_by!(email: email_for(:high)).id
      high_row = rows.find { |row| row.object.id == high_id }
      raise 'Current SLA pressure is missing' unless high_row.unanswered == 1 && high_row.sla_risk == 'imminent'
      team_rows = Report::Section::OperationalPressure.new(business: @business, from: picker.from, to: picker.to, item: 'team').rows
      raise 'Team current SLA pressure is missing' unless team_rows.any? { |row| row.unanswered.positive? }
    end

    def fixture_scope(model)
      model.where(business_id: BUSINESS_ID).where("metadata ->> 'fixture_key' LIKE ?", "#{PREFIX}%")
    end

    def insert_one(model, attributes)
      rows = model.insert_all!([attributes.merge(created_at: @now, updated_at: @now)], returning: %w[id]).rows
      raise "Unexpected #{model.name} insert result" unless rows.size == 1 && rows.first.size == 1

      model.find(rows.first.first)
    end

    def fixture_metadata(key)
      { design_system_report_fixture: true, fixture_key: "#{PREFIX}#{key}" }
    end

    def email_for(key)
      "#{PREFIX}#{key}@example.test"
    end

    def person_for(key)
      return :low_a if key.start_with?('low_a_')
      return :low_b if key.start_with?('low_b_')
      return :high if key.start_with?('high_')

      :watch
    end
end

EditorialWorkloadVisualFixture.run
