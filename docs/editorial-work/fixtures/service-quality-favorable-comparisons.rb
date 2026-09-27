# Local-only source records for favorable Service Quality KPI comparisons.
# Run from the isolated Rails checkout with DATABASE_URL set to the named database.
# Direct inserts and column updates bypass callbacks; no message is created or sent.

EXPECTED_DATABASE = 'hellotext_editorial_capture_20260926'
BUSINESS_ID = 5
SOURCE_PREFIX = 'design_system_reports_operations_'
FIXTURE_PREFIX = 'editorial_service_quality_comparison_20260927_'
PREVIOUS_FROM = Date.new(2026, 8, 28)
PREVIOUS_TO = Date.new(2026, 9, 10)
CURRENT_FROM = Date.new(2026, 9, 11)
CURRENT_TO = Date.new(2026, 9, 24)
OPEN_INTERACTIONS = 20
SLA_CHANGES = [
  { day: Date.new(2026, 8, 29), contact_index: 1 },
  { day: Date.new(2026, 8, 31), contact_index: 4 },
  { day: Date.new(2026, 9, 2), contact_index: 2 },
  { day: Date.new(2026, 9, 4), contact_index: 0 },
  { day: Date.new(2026, 9, 7), contact_index: 2 },
  { day: Date.new(2026, 9, 9), contact_index: 0 },
]

raise 'Development only' unless Rails.env.development?
raise 'Wrong database' unless ActiveRecord::Base.connection_db_config.database == EXPECTED_DATABASE
raise 'Fixture dates must be historical' unless Date.current > CURRENT_TO

business = Business.find(BUSINESS_ID)
raise 'Wrong demonstration business' unless business.name == 'Enterprise' && business.metadata['report_development_samples'] == false
raise 'Wrong report sample mode' if ENV['REPORT_WIDGET_SAMPLES'] == '1'
raise 'Active workflow' if Automation::Workflow.where(business_id: business.id).where.not(state: 'disabled').exists?
raise 'Active channel' if Channel.where(business_id: business.id).where.not(status: 'inactive').exists?
raise 'Enabled playbook' if Playbook.where(business_id: business.id, enabled: true).exists?

zone = Time.find_zone!(business.timezone)
report = Report.find_by!(identifier: 'service_quality')
picker = Report::DatePicker.new(params: { preset: 'custom', from: CURRENT_FROM.iso8601, to: CURRENT_TO.iso8601 })
raise 'Unexpected selected period' unless picker.from == CURRENT_FROM && picker.to == CURRENT_TO
raise 'Unexpected comparison period' unless picker.previous_period == { from: PREVIOUS_FROM, to: PREVIOUS_TO }

range_for = lambda do |from_date, to_date|
  zone.local(from_date.year, from_date.month, from_date.day).beginning_of_day..
    zone.local(to_date.year, to_date.month, to_date.day).end_of_day
end
previous_range = range_for.call(PREVIOUS_FROM, PREVIOUS_TO)
current_range = range_for.call(CURRENT_FROM, CURRENT_TO)

interaction_counts = lambda do |range|
  Contact::Interaction
    .where(business: business, started_at: range, state: Report::Calculator::ServiceQuality::Base::REPORTABLE_STATES)
    .where.not(conversation_id: nil)
    .group(:state).count
end
sla_counts = lambda do |range|
  SLA::Cycle
    .where(business: business, started_at: range,
      kind: Report::Calculator::ServiceQuality::Base::SLA_KINDS,
      state: Report::Calculator::ServiceQuality::Base::TERMINAL_SLA_STATES)
    .group(:state).count
end

raise 'Selected interaction cohort changed' unless interaction_counts.call(current_range) == {
  'open' => 28, 'resolved_ai' => 93, 'escalated' => 28, 'resolved_human' => 65,
}
raise 'Selected SLA cohort changed' unless sla_counts.call(current_range) == { 'met' => 168, 'breached' => 56 }

contacts = (0...16).map do |index|
  key = "#{SOURCE_PREFIX}contact_#{index}"
  contact = Contact.where(business_id: business.id).where('metadata @> ?', { fixture_key: key }.to_json).sole
  raise 'Demonstration contact is deliverable' unless contact.subscription_state == 'unconfirmed' && !contact.messageable?

  contact
end
conversations = contacts.map do |contact|
  Conversation.where(business_id: business.id, contact_id: contact.id).sole
end
teams = ['Atención · Demo reportes', 'Ventas · Demo reportes'].map do |name|
  Team.find_by!(business_id: business.id, name:)
end
playbook = Playbook.where(business_id: business.id, type: 'Playbook::Custom', enabled: false)
  .where('metadata @> ?', { fixture_key: "#{SOURCE_PREFIX}support" }.to_json).sole
workflow = Automation::Workflow.find_by!(business_id: business.id, executable_type: 'Playbook',
  executable_id: playbook.id, state: 'disabled')
channel = Channel.where(business_id: business.id, status: 'inactive', channable_type: 'Playbook')
  .find_by!(channable_id: Playbook.where(business_id: business.id, type: 'Playbook::Webchat', enabled: false).pick(:id))
kind = Interaction::Kind.find_by!(key: 'interaction_started')

open_targets = OPEN_INTERACTIONS.times.map do |index|
  day = PREVIOUS_FROM + index % 14
  started_at = zone.local(day.year, day.month, day.day, 16, index / 14)
  contact_index = (index * 5) % contacts.size
  {
    key: "#{FIXTURE_PREFIX}open_#{index}",
    contact: contacts.fetch(contact_index),
    conversation: conversations.fetch(contact_index),
    team: teams.fetch(index % teams.size),
    started_at:,
  }
end

pending_open = open_targets.filter_map do |target|
  interaction = Contact::Interaction.find_by(business_id: business.id,
    contact_id: target.fetch(:contact).id, started_at: target.fetch(:started_at))
  next target unless interaction

  expected = {
    state: 'open', ended_at: nil, escalated_at: nil, converted_at: nil,
    conversation_id: target.fetch(:conversation).id, channel_id: channel.id,
    technology_id: channel.technology_id, workflow_id: workflow.id,
    team_id: target.fetch(:team).id, last_recommending_playbook_id: playbook.id,
  }
  raise 'Existing comparison interaction differs from source' unless expected.all? { |field, value| interaction.public_send(field) == value }

  event = Interaction::Event.find_by(interaction_id: interaction.id, dedupe_key: target.fetch(:key))
  raise 'Existing comparison interaction has no matching source event' unless event &&
    event.metadata['fixture_key'] == target.fetch(:key) && event.kind_id == kind.id &&
    event.occurred_at == target.fetch(:started_at)

  nil
end

sla_targets = SLA_CHANGES.map do |change|
  day = change.fetch(:day)
  key = "#{SOURCE_PREFIX}contact_#{change.fetch(:contact_index)}"
  range = range_for.call(day, day)
  cycle = SLA::Cycle
    .joins('INNER JOIN messages AS editorial_source ON editorial_source.id = sla_cycles.started_by_message_id')
    .joins('INNER JOIN conversations AS editorial_conversation ON editorial_conversation.id = sla_cycles.conversation_id')
    .joins('INNER JOIN contacts AS editorial_contact ON editorial_contact.id = editorial_conversation.contact_id')
    .where(sla_cycles: { business_id: business.id, started_at: range })
    .where('editorial_source.source_type = ?', SOURCE_PREFIX)
    .where("editorial_contact.metadata->>'fixture_key' = ?", key).sole
  raise 'Unexpected source SLA kind' unless cycle.kind.in?(Report::Calculator::ServiceQuality::Base::SLA_KINDS.map(&:to_s))
  raise 'Unexpected source SLA target' unless cycle.target_seconds == 600 && cycle.deadline_at == cycle.started_at + 600.seconds
  raise 'Missing source response' unless cycle.responded_by_message_id.present?

  original = cycle.state == 'met' && cycle.elapsed_business_seconds == 420 &&
    cycle.responded_at == cycle.started_at + 420.seconds && cycle.breached_at.nil?
  applied = cycle.state == 'breached' && cycle.elapsed_business_seconds == 780 &&
    cycle.responded_at == cycle.started_at + 780.seconds && cycle.breached_at == cycle.deadline_at
  raise 'Source SLA cycle has unexpected state' unless original || applied

  { cycle:, pending: original }
end

raise 'Previous interaction cohort changed' unless interaction_counts.call(previous_range) == {
  'open' => 28 + OPEN_INTERACTIONS - pending_open.size,
  'resolved_ai' => 104,
  'escalated' => 28,
  'resolved_human' => 76,
}
raise 'Previous SLA cohort changed' unless sla_counts.call(previous_range) == {
  'met' => 171 - SLA_CHANGES.size + sla_targets.count { |target| target[:pending] },
  'breached' => 53 + SLA_CHANGES.size - sla_targets.count { |target| target[:pending] },
}

puts "preflight=ok database=#{EXPECTED_DATABASE} business_id=#{business.id} selected=#{CURRENT_FROM}..#{CURRENT_TO} previous=#{PREVIOUS_FROM}..#{PREVIOUS_TO} open_to_insert=#{pending_open.size} sla_to_adjust=#{sla_targets.count { |target| target[:pending] }}"

unless ENV['EDITORIAL_FIXTURE_APPLY'] == 'YES_ISOLATED_DEMO_ONLY'
  puts 'dry_run=true; set EDITORIAL_FIXTURE_APPLY=YES_ISOLATED_DEMO_ONLY to apply isolated source records'
  exit
end

inserted = 0
adjusted = 0
now = Time.current
ApplicationRecord.transaction do
  pending_open.each do |target|
    contact = target.fetch(:contact)
    conversation = target.fetch(:conversation)
    team = target.fetch(:team)
    started_at = target.fetch(:started_at)
    key = target.fetch(:key)
    raise 'Comparison interaction appeared after preflight' if Contact::Interaction.exists?(business_id: business.id, contact_id: contact.id, started_at:)

    id = Contact::Interaction.insert_all!([{ business_id: business.id, contact_id: contact.id,
      conversation_id: conversation.id, channel_id: channel.id, technology_id: channel.technology_id,
      workflow_id: workflow.id, last_recommending_playbook_id: playbook.id, team_id: team.id,
      state: 'open', started_at:, created_at: now, updated_at: now }]).rows.first.first
    Interaction::Event.insert_all!([{ business_id: business.id, interaction_id: id,
      contact_id: contact.id, conversation_id: conversation.id, channel_id: channel.id,
      technology_id: channel.technology_id, workflow_id: workflow.id,
      playbook_id: playbook.id, team_id: team.id, kind_id: kind.id,
      occurred_at: started_at, evidence_mode: 'heuristic', dedupe_key: key,
      metadata: { design_system_report_fixture: true, fixture_key: key, editorial_capture: true },
      created_at: now, updated_at: now }])
    inserted += 1
  end

  sla_targets.select { |target| target[:pending] }.each do |target|
    cycle = SLA::Cycle.lock.find(target.fetch(:cycle).id)
    raise 'Source SLA cycle changed after preflight' unless cycle.state == 'met' &&
      cycle.elapsed_business_seconds == 420 && cycle.responded_at == cycle.started_at + 420.seconds &&
      cycle.breached_at.nil? && cycle.deadline_at == cycle.started_at + 600.seconds

    cycle.update_columns(responded_at: cycle.started_at + 780.seconds,
      elapsed_business_seconds: 780, state: 'breached', breached_at: cycle.deadline_at, updated_at: now)
    adjusted += 1
  end

  raise 'Previous interaction cohort failed verification' unless interaction_counts.call(previous_range) == {
    'open' => 48, 'resolved_ai' => 104, 'escalated' => 28, 'resolved_human' => 76,
  }
  raise 'Previous SLA cohort failed verification' unless sla_counts.call(previous_range) == {
    'met' => 165, 'breached' => 59,
  }
  raise 'Selected interaction cohort changed' unless interaction_counts.call(current_range) == {
    'open' => 28, 'resolved_ai' => 93, 'escalated' => 28, 'resolved_human' => 65,
  }
  raise 'Selected SLA cohort changed' unless sla_counts.call(current_range) == { 'met' => 168, 'breached' => 56 }
end

puts "applied=true open_interactions_inserted=#{inserted} source_events_inserted=#{inserted} previous_sla_cycles_adjusted=#{adjusted}"
