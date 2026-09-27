# Reproducible, local-only data for Hellotext Help Performance and Service Quality captures.
# Run from the Rails checkout with DATABASE_URL pointing to the named isolated database.
# This file uses insert_all!/update_columns to avoid application callbacks and dispatch.

EXPECTED_DATABASE = 'hellotext_editorial_capture_20260926'
BUSINESS_ID = 5
FIXTURE_PREFIX = 'editorial_performance_20260927_'
OPERATIONS_MESSAGE_SOURCE = 'design_system_reports_operations_'
SLA_TEAM_NAME = 'Ventas · Demo reportes'
SLA_CONTACT_INDEXES = [3, 7, 11, 15]
EXPECTED_SLA_CYCLES = 20
SLA_DAILY_CHANGES = [
  { day: Date.new(2026, 9, 11), team: :human, contact_index: 7, original_seconds: 220, final_seconds: 780 },
  { day: Date.new(2026, 9, 13), team: :human, contact_index: 6, original_seconds: 420, final_seconds: 780 },
  { day: Date.new(2026, 9, 14), team: :ai, contact_index: 5, original_seconds: 420, final_seconds: 780 },
  { day: Date.new(2026, 9, 15), team: :ai, contact_index: 9, original_seconds: 420, final_seconds: 780 },
  { day: Date.new(2026, 9, 15), team: :human, contact_index: 10, original_seconds: 780, final_seconds: 420 },
  { day: Date.new(2026, 9, 16), team: :ai, contact_index: 4, original_seconds: 780, final_seconds: 420 },
  { day: Date.new(2026, 9, 18), team: :ai, contact_index: 1, original_seconds: 420, final_seconds: 780 },
  { day: Date.new(2026, 9, 19), team: :ai, contact_index: 1, original_seconds: 780, final_seconds: 420 },
  { day: Date.new(2026, 9, 19), team: :human, contact_index: 10, original_seconds: 420, final_seconds: 780 },
  { day: Date.new(2026, 9, 20), team: :ai, contact_index: 0, original_seconds: 780, final_seconds: 420 },
  { day: Date.new(2026, 9, 21), team: :ai, contact_index: 13, original_seconds: 420, final_seconds: 780 },
  { day: Date.new(2026, 9, 21), team: :human, contact_index: 14, original_seconds: 780, final_seconds: 420 },
  { day: Date.new(2026, 9, 23), team: :ai, contact_index: 12, original_seconds: 780, final_seconds: 420 },
  { day: Date.new(2026, 9, 24), team: :human, contact_index: 6, original_seconds: 780, final_seconds: 420 },
]
EXPECTED_DAILY_MET = {
  ai: [6, 6, 7, 6, 5, 7, 6, 6, 8, 7, 5, 6, 8, 7],
  human: [5, 6, 4, 5, 7, 6, 6, 5, 4, 6, 7, 6, 5, 6],
}
DATE_END = Date.new(2026, 9, 24)
DURATION_GROUPS = [
  { bucket: '1_3_days', count: 36, days: 2, from: Date.new(2026, 8, 20), through: Date.new(2026, 9, 22) },
  { bucket: '4_7_days', count: 28, days: 5, from: Date.new(2026, 8, 20), through: Date.new(2026, 9, 19) },
  { bucket: '8_30_days', count: 20, days: 11, from: Date.new(2026, 8, 20), through: Date.new(2026, 9, 12) },
  { bucket: '30_plus', count: 12, days: 34, from: Date.new(2026, 8, 10), through: Date.new(2026, 8, 20) },
]

raise 'Development only' unless Rails.env.development?
raise 'Wrong database' unless ActiveRecord::Base.connection_db_config.database == EXPECTED_DATABASE
raise 'Fixture dates are in the future' unless Date.current > DATE_END

business = Business.find(BUSINESS_ID)
raise 'Wrong demonstration business' unless business.name == 'Enterprise' && business.metadata['report_development_samples'] == false
fixture_contacts = Contact.where(business_id: business.id).where('metadata @> ?', { design_system_report_fixture: true }.to_json)
raise 'Operations fixture missing' unless fixture_contacts.count >= 16
raise 'Demonstration contacts are deliverable' unless fixture_contacts.where(subscription_state: :unconfirmed, messageable: false).count == fixture_contacts.count
raise 'A workflow is active' if Automation::Workflow.where(business_id: business.id).where.not(state: 'disabled').exists?
raise 'A channel is active' if Channel.where(business_id: business.id).where.not(status: 'inactive').exists?
raise 'A playbook is enabled' if Playbook.where(business_id: business.id, enabled: true).exists?

channel = Channel.find_by!(business_id: business.id, status: 'inactive')
raise 'Unexpected channel source' unless channel.channable_type == 'Playbook' && Playbook.find(channel.channable_id).type == 'Playbook::Webchat'
team_ai = Team.find_by!(business_id: business.id, name: 'Atención · Demo reportes')
team_human = Team.find_by!(business_id: business.id, name: SLA_TEAM_NAME)
human_user_id = Team::Member.where(team_id: team_human.id).order(:id).pick(:user_id)
raise 'No synthetic teammate' unless human_user_id
playbook = Playbook.find_by!(business_id: business.id, type: 'Playbook::Custom', enabled: false)
workflow = Automation::Workflow.find_by!(business_id: business.id, executable_type: 'Playbook', executable_id: playbook.id, state: 'disabled')
zone = Time.find_zone!(business.timezone)

source_cycle_scope = SLA::Cycle
  .joins('INNER JOIN messages AS editorial_started_messages ON editorial_started_messages.id = sla_cycles.started_by_message_id')
  .joins('INNER JOIN conversations AS editorial_conversations ON editorial_conversations.id = sla_cycles.conversation_id')
  .joins('INNER JOIN contacts AS editorial_contacts ON editorial_contacts.id = editorial_conversations.contact_id')
  .joins(<<~SQL.squish)
    INNER JOIN workload_team_intervals AS editorial_teams
      ON editorial_teams.business_id = sla_cycles.business_id
     AND editorial_teams.conversation_id = sla_cycles.conversation_id
     AND editorial_teams.started_at <= COALESCE(sla_cycles.responded_at, sla_cycles.breached_at, sla_cycles.deadline_at, sla_cycles.started_at)
     AND (editorial_teams.ended_at IS NULL OR editorial_teams.ended_at > COALESCE(sla_cycles.responded_at, sla_cycles.breached_at, sla_cycles.deadline_at, sla_cycles.started_at))
  SQL
  .where(sla_cycles: { business_id: business.id })
  .where('sla_cycles.started_at >= ? AND sla_cycles.started_at < ?', Date.new(2026, 9, 1), DATE_END + 1)
  .where('editorial_started_messages.source_type = ?', OPERATIONS_MESSAGE_SOURCE)
  .where('editorial_contacts.metadata @> ?', { design_system_report_fixture: true }.to_json)
cycle_scope = source_cycle_scope
  .where("editorial_contacts.metadata->>'fixture_key' IN (?)",
    SLA_CONTACT_INDEXES.map { |index| "#{OPERATIONS_MESSAGE_SOURCE}contact_#{index}" })
  .where('editorial_teams.team_id = ?', team_human.id)
cycle_rows = cycle_scope.distinct.pluck('sla_cycles.id', 'sla_cycles.started_at', 'sla_cycles.state',
  'sla_cycles.elapsed_business_seconds', 'sla_cycles.responded_at', 'sla_cycles.deadline_at',
  'sla_cycles.breached_at', Arel.sql("editorial_contacts.metadata->>'fixture_key'"))
selected_rows = cycle_rows.select do |_id, started_at, _state, _elapsed, _responded_at, _deadline_at, _breached_at, fixture_key|
  index = fixture_key.delete_prefix("#{OPERATIONS_MESSAGE_SOURCE}contact_").to_i
  (started_at.in_time_zone(zone).to_date.jd + index) % 5 == 3
end
raise "Expected #{EXPECTED_SLA_CYCLES} fixture cycles; found #{selected_rows.size}" unless selected_rows.size == EXPECTED_SLA_CYCLES

selected_rows.each do |_id, started_at, state, elapsed, responded_at, deadline_at, breached_at, _metadata|
  original = state == 'met' && elapsed == 420 && responded_at == started_at + 420.seconds && breached_at.nil?
  adjusted = state == 'breached' && elapsed == 780 && responded_at == started_at + 780.seconds && breached_at == deadline_at
  raise 'Unexpected SLA fixture state' unless original || adjusted
end
cycle_ids = selected_rows.filter_map do |id, _started_at, state, _elapsed, _responded_at, _deadline_at, _breached_at, _metadata|
  id if state == 'met'
end

daily_scope = source_cycle_scope.where('sla_cycles.started_at >= ? AND sla_cycles.started_at < ?', Date.new(2026, 9, 11), DATE_END + 1)
daily_rows = daily_scope.distinct.pluck('sla_cycles.id', 'sla_cycles.started_at', 'editorial_teams.team_id', 'sla_cycles.state')
daily_groups = daily_rows.group_by { |_id, started_at, team_id, _state| [started_at.in_time_zone(zone).to_date, team_id] }
raise 'Unexpected Operations SLA sample size' unless daily_rows.size == 224
(Date.new(2026, 9, 11)..DATE_END).each do |day|
  [team_ai.id, team_human.id].each do |team_id|
    rows = daily_groups.fetch([day, team_id], [])
    raise 'Unexpected daily Operations SLA denominator' unless rows.size == 8 && rows.all? { |row| %w[met breached].include?(row[3]) }
  end
end

cycle_matches = lambda do |row, seconds|
  _id, started_at, state, elapsed, responded_at, deadline_at, breached_at = row
  expected_state = seconds > 600 ? 'breached' : 'met'
  expected_breach = seconds > 600 ? deadline_at : nil
  state == expected_state && elapsed == seconds && responded_at == started_at + seconds.seconds && breached_at == expected_breach
end
daily_adjustments = SLA_DAILY_CHANGES.filter_map do |change|
  team_id = change[:team] == :ai ? team_ai.id : team_human.id
  key = "#{OPERATIONS_MESSAGE_SOURCE}contact_#{change[:contact_index]}"
  rows = daily_scope
    .where('sla_cycles.started_at >= ? AND sla_cycles.started_at < ?', change[:day], change[:day] + 1)
    .where("editorial_contacts.metadata->>'fixture_key' = ?", key)
    .where('editorial_teams.team_id = ?', team_id)
    .distinct.pluck('sla_cycles.id', 'sla_cycles.started_at', 'sla_cycles.state',
      'sla_cycles.elapsed_business_seconds', 'sla_cycles.responded_at', 'sla_cycles.deadline_at', 'sla_cycles.breached_at')
  raise 'Expected exactly one targeted Operations SLA cycle' unless rows.size == 1

  row = rows.first
  original = cycle_matches.call(row, change[:original_seconds])
  adjusted = cycle_matches.call(row, change[:final_seconds])
  raise 'Targeted Operations SLA cycle has an unexpected state' unless original || adjusted
  { id: row.first, original_seconds: change[:original_seconds], seconds: change[:final_seconds] } if original
end

planned = DURATION_GROUPS.pluck(:count).sum
puts "preflight=ok database=#{EXPECTED_DATABASE} business_id=#{BUSINESS_ID} planned_performance=#{planned} selected_sla_cycles=#{selected_rows.size} sla_cycles_to_adjust=#{cycle_ids.size} daily_sla_cycles_to_adjust=#{daily_adjustments.size}"

unless ENV['EDITORIAL_FIXTURE_APPLY'] == 'YES_ISOLATED_DEMO_ONLY'
  puts 'dry_run=true; set EDITORIAL_FIXTURE_APPLY=YES_ISOLATED_DEMO_ONLY to insert isolated demo records'
  exit
end

inserted = Hash.new(0)
kind_ids = %w[interaction_started ai_escalated interaction_resolved_ai interaction_resolved_human].index_with do |key|
  Interaction::Kind.find_by!(key:).id
end
now = Time.current
verified_daily_met = {}
verified_response_counts = []

ApplicationRecord.transaction do
  DURATION_GROUPS.each do |group|
    day_span = (group[:through] - group[:from]).to_i + 1
    group[:count].times do |index|
      fixture_key = "#{FIXTURE_PREFIX}#{group[:bucket]}_#{index}"
      metadata = { design_system_report_fixture: true, fixture_key:, editorial_capture: true }
      contact = Contact.where(business_id: business.id).where('metadata @> ?', { fixture_key: }.to_json).first
      unless contact
        id = Contact.insert_all!([{ business_id: business.id, first_name: 'Demo', last_name: "Caso #{index + 1}",
          display_name: "Demo Caso #{index + 1}", subscription_state: 'unconfirmed', messageable: false,
          metadata:, created_at: now, updated_at: now }]).rows.first.first
        contact = Contact.find(id)
        inserted[:contacts] += 1
      end
      raise 'Existing fixture contact became deliverable' unless contact.subscription_state == 'unconfirmed' && !contact.messageable?

      conversation = Conversation.where(business_id: business.id, contact_id: contact.id)
        .where('metadata @> ?', { fixture_key: }.to_json).first
      unless conversation
        id = Conversation.insert_all!([{ business_id: business.id, contact_id: contact.id,
          state: 'closed', metadata:, created_at: now, updated_at: now }]).rows.first.first
        conversation = Conversation.find(id)
        inserted[:conversations] += 1
      end

      started_day = group[:from] + index % day_span
      started_at = zone.local(started_day.year, started_day.month, started_day.day, 9, index % 50)
      ended_at = started_at + group[:days].days + (index % 3).hours
      raise 'Fixture ends after the historical range' if ended_at.to_date > DATE_END
      expected_bucket = Contact::Interaction.bucket_for(started_at:, ended_at:)
      raise "Wrong duration bucket #{expected_bucket}" unless expected_bucket == group[:bucket]
      human = index.odd?
      interaction = Contact::Interaction.find_by(business_id: business.id, contact_id: contact.id, started_at:)
      unless interaction
        id = Contact::Interaction.insert_all!([{ business_id: business.id, contact_id: contact.id,
          conversation_id: conversation.id, channel_id: channel.id, technology_id: channel.technology_id,
          workflow_id: workflow.id, last_recommending_playbook_id: playbook.id,
          team_id: human ? team_human.id : team_ai.id, user_id: human ? human_user_id : nil,
          started_at:, ended_at:, escalated_at: human ? started_at + 20.minutes : nil,
          state: human ? 'resolved_human' : 'resolved_ai', bucket: expected_bucket,
          created_at: now, updated_at: now }]).rows.first.first
        interaction = Contact::Interaction.find(id)
        inserted[:contact_interactions] += 1
      end
      raise 'Existing duration fixture differs from source' unless interaction.ended_at == ended_at && interaction.bucket == expected_bucket

      events = [
        { key: 'started', kind: 'interaction_started', at: started_at, playbook_id: playbook.id },
        { key: 'resolved', kind: human ? 'interaction_resolved_human' : 'interaction_resolved_ai',
          at: ended_at, playbook_id: human ? nil : playbook.id, human_user_id: human ? human_user_id : nil },
      ]
      events.insert(1, { key: 'escalated', kind: 'ai_escalated', at: interaction.escalated_at, playbook_id: playbook.id }) if human
      events.each do |event|
        dedupe_key = "#{fixture_key}_#{event[:key]}"
        next if Interaction::Event.exists?(interaction_id: interaction.id, dedupe_key:)

        Interaction::Event.insert_all!([{ business_id: business.id, interaction_id: interaction.id,
          kind_id: kind_ids.fetch(event[:kind]), contact_id: contact.id, conversation_id: conversation.id,
          channel_id: channel.id, technology_id: channel.technology_id, workflow_id: workflow.id,
          team_id: human ? team_human.id : team_ai.id, playbook_id: event[:playbook_id],
          human_user_id: event[:human_user_id], occurred_at: event[:at], evidence_mode: 'heuristic',
          dedupe_key:, metadata:, created_at: now, updated_at: now }])
        inserted[:interaction_events] += 1
      end
    end
  end

  SLA::Cycle.where(id: cycle_ids).find_each do |cycle|
    elapsed = 780
    response = cycle.started_at + elapsed.seconds
    raise 'Adjusted response precedes deadline' unless response > cycle.deadline_at
    cycle.update_columns(responded_at: response, elapsed_business_seconds: elapsed,
      state: 'breached', breached_at: cycle.deadline_at, updated_at: now)
    inserted[:sla_cycles_adjusted] += 1
  end

  daily_adjustments.each do |adjustment|
    cycle = SLA::Cycle.lock.find(adjustment[:id])
    current = [cycle.id, cycle.started_at, cycle.state, cycle.elapsed_business_seconds,
      cycle.responded_at, cycle.deadline_at, cycle.breached_at]
    raise 'Daily SLA cycle changed after preflight' unless cycle_matches.call(current, adjustment[:original_seconds])

    elapsed = adjustment[:seconds]
    breached = elapsed > 600
    cycle.update_columns(responded_at: cycle.started_at + elapsed.seconds, elapsed_business_seconds: elapsed,
      state: breached ? 'breached' : 'met', breached_at: breached ? cycle.deadline_at : nil, updated_at: now)
    inserted[:daily_sla_cycles_adjusted] += 1
  end

  verified_rows = daily_scope.distinct.pluck('sla_cycles.id', 'sla_cycles.started_at', 'editorial_teams.team_id', 'sla_cycles.state')
  verified_groups = verified_rows.group_by { |_id, started_at, team_id, _state| [started_at.in_time_zone(zone).to_date, team_id] }
  raise 'Daily SLA sample size changed' unless verified_rows.size == 224
  { ai: team_ai.id, human: team_human.id }.each do |team, team_id|
    verified_daily_met[team] = (Date.new(2026, 9, 11)..DATE_END).map.with_index do |day, index|
      rows = verified_groups.fetch([day, team_id], [])
      raise 'Daily SLA denominator changed' unless rows.size == 8

      met = rows.count { |row| row[3] == 'met' }
      raise 'Unexpected daily SLA trend' unless met == EXPECTED_DAILY_MET.fetch(team)[index]

      met
    end
  end

  quality = Report.find_by!(identifier: 'service_quality')
  from = zone.local(2026, 9, 11).beginning_of_day
  to = zone.local(2026, 9, 24).end_of_day
  response_items = Report::Widget::ServiceQuality::ResponseTimeDistribution.new(report: quality, business:, from:, to:).data.fetch(:items)
  verified_response_counts = response_items.map { |item| item.fetch(:tooltip).fetch(:items).first.fetch(:value).delete(',').to_i }
  raise 'Unexpected response-time distribution' unless verified_response_counts == [26, 36, 32, 25, 43]
end

puts "applied=true #{inserted.sort.map { |key, value| "#{key}=#{value}" }.join(' ')}"
puts "daily_sla_met=#{verified_daily_met} response_time_buckets=#{verified_response_counts}"
performance_scope = Contact::Interaction
  .joins('INNER JOIN contacts AS editorial_contacts ON editorial_contacts.id = contact_interactions.contact_id')
  .where(contact_interactions: { business_id: business.id })
  .where('editorial_contacts.metadata->>\'fixture_key\' LIKE ?', "#{FIXTURE_PREFIX}%")
puts "added_performance_buckets=#{performance_scope.group(:bucket).count.sort.to_h}"
puts "human_driven_buckets=#{Contact::Interaction.where(business_id: business.id, started_at: Date.new(2026, 8, 10)..DATE_END.end_of_day).where.not(escalated_at: nil).where.not(bucket: nil).group(:bucket).count.sort.to_h}"
