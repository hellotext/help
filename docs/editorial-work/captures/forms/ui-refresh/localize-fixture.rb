raise 'Wrong database' unless ActiveRecord::Base.connection.current_database == 'hellotext_editorial_workload_20260928'
business = Business.find(5)
raise 'Wrong business' unless business.handle == 'hellotext'
editor = User.find_by!(email: 'design-system@example.test')
raise 'Wrong editor' unless editor.id == 1
raise 'Unexpected contacts' unless business.contacts.count == 127 && business.contacts.subscribed.count.zero? && business.contacts.where(messageable: true).none? && business.messages.count == 49
raise 'Enabled playbook' if business.playbooks.kept.where(enabled: true).exists?
raise 'Unexpected forms' unless business.captures.forms.count == 1
form = Artifact::Form.find_by!(hashed_id: '3oDXBQG4')
raise 'Wrong form owner or state' unless form.business.id == 5 && form.capture.draft? && form.submissions.count.zero?
raise 'Wrong mode' unless %w[dry-run commit].include?(ENV.fetch('EDITORIAL_FORM_MODE', 'dry-run'))

copy = {
  'es' => { header: 'Recibe novedades de Editorial Demo.', label: 'Teléfono',
            placeholder: 'Número de teléfono', button: 'Suscribirme',
            footer: 'Al suscribirte, aceptas recibir mensajes SMS de Editorial Demo. Consulta nuestros términos y aviso de privacidad.' },
  'en' => { header: 'Get updates.', label: 'Phone number',
            placeholder: 'Phone number', button: 'Subscribe',
            footer: 'By subscribing, you agree to receive SMS updates from Editorial Demo. See our terms and privacy notice.' }
}
target = ENV.fetch('EDITORIAL_FORM_LOCALE')
raise 'Invalid target locale' unless copy.key?(target)
source = target == 'es' ? 'en' : 'es'
source = editor.locale
raise 'Unexpected starting locale' unless copy.key?(source)
step = form.steps.first
raise 'Unexpected starting header' unless step.header.content.to_plain_text.strip == copy[source][:header]
raise 'Unexpected starting footer' unless step.footer.content.to_plain_text.strip == copy[source][:footer]
raise 'Unexpected starting input' unless step.inputs.first.label == copy[source][:label]
raise 'Unexpected starting button' unless step.button.text == copy[source][:button]

mode = ENV.fetch('EDITORIAL_FORM_MODE', 'dry-run')
ActiveRecord::Base.transaction do
  editor.update!(locale: target)
  Current.locale = target
  I18n.locale = target
  step.header.update!(content: "<h4><strong>#{copy[target][:header]}</strong></h4>")
  step.footer.update!(content: "<div><span style=\"color: #5A6978\">#{copy[target][:footer]}</span></div>")
  step.inputs.first.update!(label: copy[target][:label], placeholder: copy[target][:placeholder])
  step.button.update!(text: copy[target][:button])
  raise 'Form became active' unless form.capture.reload.draft?
  raise 'Submission appeared' unless form.submissions.count.zero?
  raise 'Subscriber appeared' unless business.contacts.subscribed.count.zero?
  puts({mode: mode, database: ActiveRecord::Base.connection.current_database,
        account_locale: editor.locale, form_hash: form.hashed_id,
        capture_state: form.capture.state, submissions: form.submissions.count,
        subscribers: business.contacts.subscribed.count}.inspect)
  raise ActiveRecord::Rollback if mode == 'dry-run'
end
