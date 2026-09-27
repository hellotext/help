# Local-only CSAT answer adjustment for the Service Quality editorial capture.
# Run against the named isolated database. No contacts, messages or sends are created.

EXPECTED_DATABASE = 'hellotext_editorial_capture_20260926'
BUSINESS_ID = 5
SOURCE_PREFIX = 'design_system_reports_operations_'
FROM = Date.new(2026, 9, 11)
TO = Date.new(2026, 9, 24)
PREVIOUS_FROM = Date.new(2026, 8, 28)
PREVIOUS_TO = Date.new(2026, 9, 10)

# Seven escalated and two human-from-beginning answers. This is the minimum
# number of outcome changes that makes the aggregate teammate trend favorable.
TARGETS = [
  { day: Date.new(2026, 8, 28), contact_index: 2, path: 'escalated_to_human' },
  { day: Date.new(2026, 8, 29), contact_index: 1, path: 'escalated_to_human' },
  { day: Date.new(2026, 8, 30), contact_index: 0, path: 'human_from_beginning' },
  { day: Date.new(2026, 9, 1), contact_index: 14, path: 'escalated_to_human' },
  { day: Date.new(2026, 9, 3), contact_index: 4, path: 'escalated_to_human' },
  { day: Date.new(2026, 9, 5), contact_index: 2, path: 'escalated_to_human' },
  { day: Date.new(2026, 9, 7), contact_index: 0, path: 'human_from_beginning' },
  { day: Date.new(2026, 9, 9), contact_index: 14, path: 'escalated_to_human' },
  { day: Date.new(2026, 9, 10), contact_index: 5, path: 'escalated_to_human' },
].freeze

raise 'Development only' unless Rails.env.development?
raise 'Wrong database' unless ActiveRecord::Base.connection_db_config.database == EXPECTED_DATABASE
raise 'Fixture dates must be historical' unless Date.current > TO
raise 'Wrong report sample mode' unless ENV['REPORT_WIDGET_SAMPLES'] == '0'

business = Business.find(BUSINESS_ID)
raise 'Wrong demonstration business' unless business.name == 'Enterprise' && business.metadata['report_development_samples'] == false
raise 'Active workflow' if Automation::Workflow.where(business_id: business.id).where.not(state: 'disabled').exists?
raise 'Active channel' if Channel.where(business_id: business.id).where.not(status: 'inactive').exists?
raise 'Enabled playbook' if Playbook.where(business_id: business.id, enabled: true).exists?

picker = Report::DatePicker.new(params: { preset: 'custom', from: FROM.iso8601, to: TO.iso8601 })
raise 'Unexpected selected period' unless picker.from == FROM && picker.to == TO
raise 'Unexpected comparison period' unless picker.previous_period == { from: PREVIOUS_FROM, to: PREVIOUS_TO }
report = Report.find_by!(identifier: 'service_quality')

Time.use_zone(business.timezone) do
  range_for = lambda do |first, last|
    first.beginning_of_day..last.end_of_day
  end
  current_range = range_for.call(FROM, TO)
  previous_range = range_for.call(PREVIOUS_FROM, PREVIOUS_TO)
  counts_for = lambda do |range|
    Playbook::CSAT::Attempt
      .where(business:, answered_at: range, outcome: Playbook::CSAT::Attempt::OUTCOMES)
      .group(:resolution_path, :outcome).count
  end
  current_counts = {
    ['ai_only', 'positive'] => 68, ['ai_only', 'negative'] => 16,
    ['escalated_to_human', 'positive'] => 26, ['escalated_to_human', 'negative'] => 9,
    ['human_from_beginning', 'positive'] => 16, ['human_from_beginning', 'negative'] => 5,
  }
  raise 'Selected CSAT cohort changed' unless counts_for.call(current_range) == current_counts

  csat_playbook = Playbook.where(business_id: business.id, type: 'Playbook::CSAT', enabled: false)
    .where('metadata @> ?', { fixture_key: "#{SOURCE_PREFIX}csat" }.to_json).sole
  targets = TARGETS.map do |target|
    day = target.fetch(:day)
    key = "#{SOURCE_PREFIX}contact_#{target.fetch(:contact_index)}"
    attempt = Playbook::CSAT::Attempt
      .joins(:contact)
      .where(business_id: business.id, answered_at: range_for.call(day, day), playbook_id: csat_playbook.id)
      .where("contacts.metadata->>'fixture_key' = ?", key).sole
    interaction = attempt.contact_interaction
    contact = attempt.contact
    raise 'Unexpected source CSAT answer' unless attempt.metadata['fixture_key'] == "#{SOURCE_PREFIX}csat" &&
      attempt.resolution_path == target.fetch(:path) && attempt.outcome.in?(%w[positive negative]) &&
      attempt.asked_at == interaction.ended_at && attempt.answered_at == interaction.ended_at + 2.minutes &&
      attempt.prompt_message_id.nil? && attempt.answer_message_id.nil? && attempt.delivered_at.nil?
    raise 'Unexpected source interaction' unless interaction.business_id == business.id &&
      interaction.contact_id == contact.id && interaction.state == 'resolved_human' &&
      interaction.started_at.in_time_zone.to_date == day &&
      (interaction.escalated_at.present? ? 'escalated_to_human' : 'human_from_beginning') == target.fetch(:path)
    raise 'Demonstration contact is deliverable' unless contact.subscription_state == 'unconfirmed' && !contact.messageable?

    { attempt:, pending: attempt.outcome == 'positive', path: target.fetch(:path) }
  end

  pending_escalated = targets.count { |target| target[:pending] && target[:path] == 'escalated_to_human' }
  pending_human = targets.count { |target| target[:pending] && target[:path] == 'human_from_beginning' }
  applied_escalated = 7 - pending_escalated
  applied_human = 2 - pending_human
  previous_counts = {
    ['ai_only', 'positive'] => 60, ['ai_only', 'negative'] => 24,
    ['escalated_to_human', 'positive'] => 32 - applied_escalated,
    ['escalated_to_human', 'negative'] => 3 + applied_escalated,
    ['human_from_beginning', 'positive'] => 18 - applied_human,
    ['human_from_beginning', 'negative'] => 3 + applied_human,
  }
  raise 'Previous CSAT cohort changed' unless counts_for.call(previous_range) == previous_counts

  puts "preflight=ok database=#{EXPECTED_DATABASE} business_id=#{business.id} selected=#{FROM}..#{TO} previous=#{PREVIOUS_FROM}..#{PREVIOUS_TO} answers_to_adjust=#{targets.count { |target| target[:pending] }}"
  unless ENV['EDITORIAL_FIXTURE_APPLY'] == 'YES_ISOLATED_DEMO_ONLY'
    puts 'dry_run=true; set EDITORIAL_FIXTURE_APPLY=YES_ISOLATED_DEMO_ONLY to apply isolated source records'
    exit
  end

  adjusted = 0
  ApplicationRecord.transaction do
    targets.select { |target| target[:pending] }.each do |target|
      attempt = Playbook::CSAT::Attempt.lock.find(target.fetch(:attempt).id)
      raise 'Source CSAT answer changed after preflight' unless attempt.outcome == 'positive' &&
        attempt.metadata['fixture_key'] == "#{SOURCE_PREFIX}csat" &&
        attempt.resolution_path == target.fetch(:path) && attempt.answer_message_id.nil? && attempt.prompt_message_id.nil?

      attempt.update_columns(outcome: 'negative', updated_at: Time.current)
      adjusted += 1
    end

    raise 'Previous CSAT cohort failed verification' unless counts_for.call(previous_range) == {
      ['ai_only', 'positive'] => 60, ['ai_only', 'negative'] => 24,
      ['escalated_to_human', 'positive'] => 25, ['escalated_to_human', 'negative'] => 10,
      ['human_from_beginning', 'positive'] => 16, ['human_from_beginning', 'negative'] => 5,
    }
    raise 'Selected CSAT cohort changed' unless counts_for.call(current_range) == current_counts

    I18n.with_locale(:en) do
      widget = Report::Widget::ServiceQuality::CustomerSatisfaction.new(report:, business:, from: FROM, to: TO)
      ai, teammate = widget.data
      raise 'AI CSAT comparison changed' unless ai[:value] == '81%' && ai.dig(:trend, :value) == '+13%' && ai.dig(:trend, :favorable)
      raise 'Teammate CSAT comparison is not favorable' unless teammate[:value] == '75%' &&
        teammate.dig(:trend, :value) == '+2%' && teammate.dig(:trend, :favorable)
    end
  end

  puts "applied=true prior_positive_answers_changed=#{adjusted} selected_teammate_csat=75% previous_teammate_csat=73.2% teammate_trend=+2% favorable=true"
end
