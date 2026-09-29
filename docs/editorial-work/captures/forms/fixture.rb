expected_database = 'hellotext_editorial_workload_20260928'
raise 'Wrong database' unless ActiveRecord::Base.connection.current_database == expected_database
business = Business.find(5)
raise 'Wrong business' unless business.handle == 'hellotext'
editor = User.find_by!(email: 'design-system@example.test')
raise 'Unexpected editor' unless editor.id == 1 && editor.locale == 'es'
raise 'Unexpected contact count' unless business.contacts.count == 127
raise 'Unexpected subscriber' unless business.contacts.subscribed.count.zero?
raise 'Existing form requires a separate audit' unless business.captures.forms.count.zero?
raise 'Wrong mode' unless %w[dry-run commit].include?(ENV.fetch('EDITORIAL_FORM_MODE', 'dry-run'))

Current.user = editor
Current.business = business
params = ActionController::Parameters.new(
  capture: { name: 'Newsletter | Editorial Demo' },
  steps: [{
    id: Nanoid.generate(size: 10), name: 'Paso 1', position: 1,
    header: { content: '<div>Recibe novedades de Editorial Demo.</div>' },
    inputs: [{ kind: 'phone', property: business.properties.phone.hashed_id,
               label: 'Teléfono', placeholder: 'Número de teléfono', required: true }],
    button: { text: 'Suscribirme' },
    footer: { content: '<div>Al suscribirte, aceptas recibir mensajes SMS de Editorial Demo. Consulta nuestros términos y aviso de privacidad.</div>' }
  }]
).permit!

mode = ENV.fetch('EDITORIAL_FORM_MODE', 'dry-run')
ActiveRecord::Base.transaction do
  form = Capture::StepsService.new(business: business, capturable: Artifact::Form.new, params: params).sync
  form.capture.update!(state: 'draft')
  raise 'Form did not stay draft' unless form.capture.draft?
  raise 'No eligible subscribers expected' unless business.contacts.subscribed.count.zero?
  raise 'Unexpected form structure' unless form.steps.count == 1 && form.nodes.inputs.count == 1
  raise 'Unexpected content' unless form.steps.first.footer.content.to_plain_text.include?('mensajes SMS')
  puts({ mode: mode, database: ActiveRecord::Base.connection.current_database,
         business_id: business.id, form_id: form.id, form_hash: form.hashed_id,
         capture_id: form.capture.id, capture_state: form.capture.state,
         steps: form.steps.count, inputs: form.nodes.inputs.count,
         submissions: form.submissions.count, subscribers: business.contacts.subscribed.count }.inspect)
  raise ActiveRecord::Rollback if mode == 'dry-run'
end
