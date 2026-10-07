require 'json'
raise 'Wrong database' unless ActiveRecord::Base.connection.select_value('SELECT current_database()') == 'hellotext_help_batch_20261007'
raise 'Jobs enabled' unless ActiveJob::Base.queue_adapter.is_a?(ActiveJob::QueueAdapters::TestAdapter)
raise 'Mail enabled' if ActionMailer::Base.perform_deliveries
raise 'Unsafe contacts' if Contact.where(messageable: true).exists?
raise 'Connected provider' if PhoneNumber.where(e164: %w[+12025550100 +12025550101 +12025550123]).where.not(provider_id: nil).exists?
locale = ARGV.fetch(0)
raise 'Invalid locale' unless %w[es en].include?(locale)
bodies = {
  'es' => ['Gracias por tu consulta. Te responderemos en cuanto revisemos los detalles.', 'Conoce las novedades que preparamos para esta semana.', 'Los productos de tu carrito siguen disponibles para ti.'],
  'en' => ['Thanks for your question. We will review the details and get back to you with an update.', 'See the new arrivals we have prepared for this week.', 'The products in your cart are still available for you.']
}
ActiveRecord::Base.transaction do
  User.find_by!(email: 'design-system@example.test').update_columns(locale: locale)
  [57, 58, 59].zip(bodies.fetch(locale)).each do |id, body|
    message = Message.find(id)
    raise 'Wrong fixture' unless message.metadata['editorial_fixture'] == 'message-failure-20261007'
    message.rich_text_body.update!(body: body)
  end
end
puts JSON.generate(locale: locale, stored_messages: Business.find(5).messages.count, sends_executed: 0)
