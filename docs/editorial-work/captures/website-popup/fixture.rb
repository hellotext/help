raise 'Wrong environment' unless Rails.env.development? && ActiveRecord::Base.connection.current_database == 'hellotext_editorial_workload_20260928'
business = Business.find(5)
owner = User.find_by!(email: 'design-system@example.test')
raise 'Wrong owner' unless owner.id == 1 && business.handle == 'hellotext' && Privilege.where(business_id: 5, user_id: 1, role: 'owner', discarded_at: nil).exists?
raise 'Unsafe contacts or messages' unless business.contacts.count == 127 && business.contacts.where(messageable: true).none? && business.contacts.subscribed.none? && business.messages.count == 49
raise 'Enabled playbook' if business.playbooks.kept.where(enabled: true).exists?
locale = ARGV.fetch(0)
raise 'Unexpected locale' unless %w[es en].include?(locale)
Current.locale = locale
I18n.locale = locale
capture = business.captures.kept.find_by(capturable_type: 'Popup', name: 'Popup editorial · ejemplo')
raise 'Unexpected other popup' if business.captures.kept.where(capturable_type: 'Popup').where.not(id: capture&.id).exists?
popup = capture&.capturable || Popup.new(Popup.draft_defaults.merge(hidden: true, desktop_layout_name: 'footer', mobile_layout_name: 'default', overlay_background_color: '#f0e4ff'))
raise 'Unsafe popup' if popup.persisted? && (!capture.draft? || !popup.hidden? || popup.submissions.any? || capture.journey_id? || capture.coupon_id?)
capture ||= business.captures.new(capturable: popup, name: 'Popup editorial · ejemplo', state: 'draft')
copy = locale == 'es' ? ['Novedades de Tienda Ejemplo','Recibe ideas y lanzamientos por email.','Continuar','Al suscribirte, aceptas recibir emails de marketing. Puedes cancelar tu suscripción.','¿Cómo te llamas?','Tu nombre nos ayuda a personalizar las novedades.','Nombre','Suscribirme','¡Gracias por tu interés!','Puedes seguir explorando Tienda Ejemplo.','Seguir explorando'] : ['News from Example Store','Get ideas and product launches by email.','Continue','By subscribing, you agree to receive marketing emails. You can unsubscribe.','What is your name?','Your name helps us personalize our updates.','First name','Subscribe','Thanks for your interest!','You can keep exploring Example Store.','Keep exploring']
popup.assign_attributes(completion_headline: copy[8], completion_description: copy[9], completion_button_text: copy[10], completion_footer_text: '')
previous = popup.persisted? ? popup.steps.to_a : []
steps = [
 {id: previous[0]&.hashed_id, name: locale == 'es' ? 'Email' : 'Email', position: 1, header: {content: "<h4><strong>#{copy[0]}</strong></h4><div>#{copy[1]}</div>"}, inputs: [{id: previous[0]&.inputs&.first&.hashed_id, kind: 'email', property: business.properties.email.hashed_id, placeholder: locale == 'es' ? 'Tu email' : 'Your email', required: true, position: 1}], button: {text: copy[2]}, footer: {content: copy[3]}},
 {id: previous[1]&.hashed_id, name: copy[6], position: 2, header: {content: "<h4><strong>#{copy[4]}</strong></h4><div>#{copy[5]}</div>"}, inputs: [{id: previous[1]&.inputs&.first&.hashed_id, kind: 'first_name', placeholder: copy[6], required: false, position: 1}], button: {text: copy[7]}, footer: {content: ''}}
]
ActiveRecord::Base.transaction do
 Popup::Saver.new(business:, popup:, capture:, params: {steps:}).run
 raise 'Unsafe fixture after preparation' unless popup.reload.hidden? && capture.reload.draft? && popup.steps.count == 2 && popup.submissions.none? && capture.journey_id.nil? && capture.coupon_id.nil?
 raise 'Safety counts changed' unless business.contacts.count == 127 && business.contacts.where(messageable: true).none? && business.contacts.subscribed.none? && business.messages.count == 49
end
puts({popup_id: popup.id, popup_hash: popup.hashed_id, hidden: popup.hidden?, capture_state: capture.state, steps: popup.steps.count, submissions: popup.submissions.count, journey: nil, coupon: nil, locale:}.to_json)
