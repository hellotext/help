require 'json'
raise 'Wrong database' unless ActiveRecord::Base.connection.select_value('SELECT current_database()') == 'hellotext_help_inbox_task8_20261007'
data = {
  database: 'hellotext_help_inbox_task8_20261007',
  messages: Business.find(5).messages.count,
  messageable_contacts: Contact.where(messageable: true).count,
  enabled_playbooks: Playbook.where(enabled: true).count,
  active_workflows: Automation::Workflow.where(state: :active).count,
  connected_integrations: Integration.count,
  authorization_tokens: AuthorizationToken.count,
  fixture_provider_connections: PhoneNumber.where(e164: %w[+12025550100 +12025550101 +12025550123]).where.not(provider_id: nil).count,
  job_adapter: ActiveJob::Base.queue_adapter.class.name,
  mail_deliveries: ActionMailer::Base.perform_deliveries,
  owner_locale: User.find_by!(email: 'design-system@example.test').locale,
  error_fixtures: Message.where(id: [57, 58, 59]).pluck(:id, :state)
}
raise 'Unexpected message count' unless data[:messages] == 53 + Message.where("metadata ->> 'editorial_fixture' = ?", 'inbox-overview-task8').count
%i[messageable_contacts enabled_playbooks active_workflows connected_integrations authorization_tokens fixture_provider_connections].each do |key|
  raise "Unsafe #{key}" unless data[key].zero?
end
raise 'Delivery enabled' unless data[:job_adapter].end_with?('TestAdapter') && !data[:mail_deliveries]
raise 'Fixture state changed' unless data[:error_fixtures].all? { it.last == 'error' }
puts JSON.pretty_generate(data)
