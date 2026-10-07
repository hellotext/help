require 'json'

connection = ActiveRecord::Base.connection
raise 'Wrong demo database' unless connection.select_value('SELECT current_database()') == 'hellotext_help_batch_20261007'
raise 'Jobs must remain unexecuted' unless ActiveJob::Base.queue_adapter.is_a?(ActiveJob::QueueAdapters::TestAdapter)
raise 'Mail must remain disabled' if ActionMailer::Base.perform_deliveries
raise 'Contact safety guard' if Contact.where(messageable: true).exists?
raise 'Integration safety guard' if Integration.exists? || AuthorizationToken.exists?

business = Business.find(5)
user = User.find_by!(email: 'design-system@example.test')
raise 'Fixture already exists' if business.messages.where("metadata ->> 'editorial_fixture' = ?", 'message-failure-20261007').exists?

ActiveRecord::Base.transaction do
  numbers = %w[+12025550100 +12025550101 +12025550123].map do |number|
    raise 'Reserved fixture number already exists' if PhoneNumber.exists?(e164: number)
    PhoneNumber.create!(e164: number, country: Country.find_by!(code: 'US'), skip_assign_provider: true)
  end
  channels = numbers.first(2).map do |number|
    Channel.create!(business:, technology: Technology.sms, channable: number, status: :active)
  end
  raise 'No provider may be configured' if numbers.any?(&:provider_id?)
  destination = numbers.last.find_or_associate_identity
  cases = [
    { key: 'retry', contact_id: 8, platform: GatewayPlatform.twilio, code: 'failed', body: 'Gracias por tu consulta. Te responderemos en cuanto revisemos los detalles.' },
    { key: 'unsubscribed', contact_id: 9, platform: GatewayPlatform.hellotext, code: 'profile_unsubscribed', body: 'Conoce las novedades que preparamos para esta semana.' },
    { key: 'converted', contact_id: 10, platform: GatewayPlatform.hellotext, code: 'cart_saver_converted_cancellation', body: 'Los productos de tu carrito siguen disponibles para ti.' }
  ]
  results = cases.map do |item|
    contact = business.contacts.find(item[:contact_id])
    raise 'Contact must remain non-messageable' if contact.messageable?
    contact.update_columns(subscription_state: 'unsubscribed') if item[:key] == 'unsubscribed'
    conversation = contact.private_conversation
    raise 'Expected existing demo conversation' unless conversation&.persisted?
    code = item[:platform].status_codes.find_or_create_by!(code: item[:code]) do
      it.description = item[:code].tr('_', ' ')
      it.retriable = item[:key] == 'retry'
    end
    message = Message.create!(
      business:, contact:, user:, destination:, technology: Technology.sms,
      channel: channels.first, state: :error, source_type: item[:platform].name.downcase,
      state_updated_at: Time.current, body: item[:body], deliver: false,
      metadata: { editorial_fixture: 'message-failure-20261007', editorial_case: item[:key] }
    )
    message.responses.create!(kind: :error, gateway_platform: item[:platform], gateway_platform_code: code)
    Event.create!(conversation:, eventable: message, creator: user, original_created_at: Time.current)
    failure = Message::DeliveryFailure.new(message)
    expected = item[:key] == 'retry' ? 2 : 0
    raise 'Unexpected retry options' unless failure.retry_channels.count == expected
    { case: item[:key], message: message.id, conversation: conversation.hashed_id, reason: failure.reason, retry_channels: expected }
  end
  out = {
    cases: results, reserved_numbers: numbers.map(&:e164), provider_connections: 0,
    messages: business.messages.count, messageable: Contact.where(messageable: true).count,
    active_fixture_channels: channels.map(&:id), sends_executed: 0, retries_executed: 0,
    jobs: ActiveJob::Base.queue_adapter.class.name, mail_deliveries: ActionMailer::Base.perform_deliveries
  }
  File.write(Rails.root.join('tmp/failure-fixtures.json'), JSON.pretty_generate(out))
  puts JSON.generate(out)
end
