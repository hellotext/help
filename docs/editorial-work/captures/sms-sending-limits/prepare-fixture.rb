require 'json'

connection = ActiveRecord::Base.connection
raise 'Wrong demo database' unless connection.select_value('SELECT current_database()') == 'hellotext_help_batch_20261007'
raise 'Jobs must remain unexecuted' unless ActiveJob::Base.queue_adapter.is_a?(ActiveJob::QueueAdapters::TestAdapter)
raise 'Mail must remain disabled' if ActionMailer::Base.perform_deliveries
raise 'Contact safety guard' if Contact.where(messageable: true).exists?
raise 'Integration safety guard' if Integration.exists?
raise 'Token safety guard' if AuthorizationToken.exists?

business = Business.find(5)
user = User.find_by!(email: 'design-system@example.test')
contact = business.contacts.find(7)
raise 'Expected fictional contact' unless contact.name == 'Camila Torres'
conversation = contact.private_conversation
raise 'Expected existing demo conversation' unless conversation&.persisted?
raise 'Fixture already exists' if business.messages.where("metadata ->> 'editorial_fixture' = ?", 'sms-limits-20261007').exists?

ActiveRecord::Base.transaction do
  message = Message.create!(
    business:, contact:, user:, technology: Technology.sms, channel: Channel.find(1),
    state: :error, source_type: 'hellotext', state_updated_at: Time.current,
    metadata: { editorial_fixture: 'sms-limits-20261007' }, deliver: false,
    body: 'Gracias por tu consulta. Te responderemos en cuanto revisemos los detalles.'
  )
  message.responses.create!(
    kind: :error, gateway_platform: GatewayPlatform.hellotext,
    gateway_platform_code: GatewayPlatform.hellotext.status_codes.find_by!(code: 'daily_message_limit_reached')
  )
  Event.create!(conversation:, eventable: message, creator: user, original_created_at: Time.current)
  business.reputation.update_columns(daily_messages_count: 50, last_message_sent_at: Time.current)
  result = {
    fixture: 'sms-limits-20261007', business: business.id, message: message.id,
    conversation: conversation.hashed_id, status_label: Message::DeliveryFailure.new(message).status_label,
    messages: business.messages.count, messageable: Contact.where(messageable: true).count,
    enabled_playbooks: Playbook.where(enabled: true).count,
    active_workflows: Automation::Workflow.where(state: :active).count,
    jobs: ActiveJob::Base.queue_adapter.class.name, mail_deliveries: ActionMailer::Base.perform_deliveries,
    sends_executed: 0
  }
  File.write(Rails.root.join('tmp/sms-fixture.json'), JSON.pretty_generate(result))
  puts JSON.generate(result)
end
