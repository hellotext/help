raise 'Wrong environment' unless Rails.env.development? && ActiveRecord::Base.connection.current_database == 'hellotext_editorial_workload_20260928'
business = Business.find(5)
owner = User.find_by!(email: 'design-system@example.test')
raise 'Wrong owner' unless owner.id == 1 && business.handle == 'hellotext' && Privilege.where(business_id: 5, user_id: 1, role: 'owner', discarded_at: nil).exists?
raise 'Unsafe contacts or messages' unless business.contacts.count == 127 && business.contacts.where(messageable: true).none? && business.contacts.subscribed.none? && business.messages.count == 49
raise 'Enabled playbook' if business.playbooks.kept.where(enabled: true).exists?
locale = ARGV.fetch(0)
raise 'Unexpected locale' unless %w[es en restore].include?(locale)
locale = 'es' if locale == 'restore'
owner.update_columns(locale:)
business.update_columns(name: ARGV[0] == 'restore' ? 'Enterprise' : locale == 'es' ? 'Tienda Ejemplo' : 'Example Store')
popup = Popup.find(1)
capture = popup.capture
raise 'Wrong existing draft' unless popup.hashed_id == 'e9Z2LN51' && capture.business_id == 5 && capture.draft? && popup.hidden? && popup.steps.count == 2 && popup.submissions.none? && capture.coupon_id.nil? && capture.journey_id.nil?
copy = locale == 'es' ? ['Novedades de Tienda Ejemplo','Recibe ideas y lanzamientos por email.','Continuar','Al suscribirte, aceptas recibir emails de marketing. Puedes cancelar tu suscripción.','¿Cómo te llamas?','Tu nombre nos ayuda a personalizar las novedades.','Nombre','Suscribirme','¡Gracias por tu interés!','Puedes seguir explorando Tienda Ejemplo.','Seguir explorando'] : ['News from Example Store','Get ideas and product launches by email.','Continue','By subscribing, you agree to receive marketing emails. You can unsubscribe.','What is your name?','Your name helps us personalize our updates.','First name','Subscribe','Thanks for your interest!','You can keep exploring Example Store.','Keep exploring']
capture.update_columns(name: locale == 'es' ? 'Popup editorial · ejemplo' : 'Editorial popup · example')
steps = popup.steps.order(:position).to_a
ActiveRecord::Base.transaction do
  popup.update!(completion_headline: copy[8], completion_description: copy[9], completion_button_text: copy[10])
  steps[0].headers.first.update!(content: "<h4><strong>#{copy[0]}</strong></h4><div>#{copy[1]}</div>")
  steps[0].footers.first.update!(content: copy[3])
  steps[0].buttons.first.update!(text: copy[2])
  steps[0].inputs.first.update!(placeholder: locale == 'es' ? 'Tu email' : 'Your email')
  steps[1].update!(name: copy[6])
  steps[1].headers.first.update!(content: "<h4><strong>#{copy[4]}</strong></h4><div>#{copy[5]}</div>")
  steps[1].buttons.first.update!(text: copy[7])
  steps[1].inputs.first.update!(placeholder: copy[6])
end
load File.join(__dir__, 'preflight.rb')
