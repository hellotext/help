require 'json'

connection = ActiveRecord::Base.connection
raise 'copy database guard' unless connection.select_value('SELECT current_database()') == 'hellotext_editorial_recovery_20261004'
raise 'queue guard' unless ActiveJob::Base.queue_adapter.is_a?(ActiveJob::QueueAdapters::TestAdapter)
raise 'mail guard' unless ActionMailer::Base.perform_deliveries == false
raise 'migration guard' if ActiveRecord::Base.connection_pool.migration_context.needs_migration?
private_overrides = JSON.parse(File.read(Rails.root.join('tmp/editorial-recovery-env.json')))
%w[AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY STRIPE_PRIVATE_KEY].each do |key|
  raise 'provider override guard' unless ENV[key] == private_overrides.fetch(key)
end
provider_keys = ENV.keys.grep(/OPENAI|ANTHROPIC|GEMINI|TWILIO|SENDGRID|VTEX|FENICIO|MERCADO|SHOPIFY/).select { it.match?(/KEY|TOKEN|SECRET|PASSWORD/) }
raise 'provider credential guard' unless provider_keys.all? { |key| ENV[key].blank? || ENV[key].match?(/editorial|disabled|dummy|fake|example|test/i) }

action = ARGV.fetch(0)
raise 'unsupported action' unless %w[prepare restore inspect].include?(action)
directory = Rails.root.join('tmp/visual-recovery/enablement-active-demo')
FileUtils.mkdir_p(directory)
snapshot_file = directory.join('restoration.json')

connection.transaction do
  connection.execute('SET TRANSACTION READ ONLY') if action == 'inspect'
  business = Business.find(5)
  owner = User.find_by!(email: 'design-system@example.test')
  raise 'owner guard' unless Privilege.where(business_id: 5, user_id: owner.id, role: 'owner').exists?
  raise 'fictional users guard' if User.where.not("email LIKE ?", '%@example.test').exists?
  raise 'contacts guard' unless business.contacts.count == 127 && !business.contacts.where(messageable: true).exists? && !business.contacts.subscribed.exists?
  raise 'tokens/integrations guard' if business.tokens.exists? || business.integrations.exists?
  raise 'outcome guard' unless business.messages.count == 49 && CG::Composer::Run.count.zero? && CG::Composer::Draft.count.zero?

  playbook = business.playbooks.find(33)
  raise 'expected saved fixture' unless playbook.is_a?(Playbook::Custom) && playbook.hashed_id == 'BbZzpNd9' && playbook.name == 'Asistente de atención · Demo' && playbook.kept?
  raise 'conversation guard' if playbook.ai_conversations.exists? || playbook.conversations.exists?
  workflow = playbook.workflow
  raise 'existing owned workflow guard' unless workflow && workflow.business_id == 5 && workflow.kept? && workflow.executable_id == 33 && workflow.executable_type == 'Playbook'
  raise 'valid fixture guard' unless playbook.valid? && workflow.valid?

  if action == 'prepare'
    raise 'restore snapshot already exists' if snapshot_file.exist?
    raise 'inactive baseline guard' unless !playbook.enabled? && workflow.disabled? && business.playbooks.where(enabled: true).count.zero? && business.workflows.active.count.zero?
    snapshot = {playbook_id: playbook.id, workflow_id: workflow.id, enabled: playbook.enabled, workflow_state: workflow.state, playbook_updated_at: playbook.updated_at.iso8601(6), workflow_updated_at: workflow.updated_at.iso8601(6)}
    File.write(snapshot_file, JSON.pretty_generate(snapshot) + "\n")
    playbook.update_columns(enabled: true)
    workflow.update_columns(state: 'active')
  elsif action == 'restore'
    snapshot = JSON.parse(File.read(snapshot_file))
    raise 'snapshot identity guard' unless snapshot.values_at('playbook_id', 'workflow_id') == [playbook.id, workflow.id] && snapshot['enabled'] == false && snapshot['workflow_state'] == 'disabled'
    raise 'contained active state guard' unless playbook.enabled? && workflow.active? && business.playbooks.where(enabled: true).count == 1 && business.workflows.active.count == 1
    playbook.update_columns(enabled: snapshot.fetch('enabled'))
    workflow.update_columns(state: snapshot.fetch('workflow_state'))
    raise 'timestamps guard' unless playbook.reload.updated_at.iso8601(6) == snapshot['playbook_updated_at'] && workflow.reload.updated_at.iso8601(6) == snapshot['workflow_updated_at']
  end

  output = {
    at_utc: Time.now.utc.iso8601, action:, database: 'hellotext_editorial_recovery_20261004',
    fixture: {playbook_id: playbook.id, public_id: playbook.hashed_id, name: playbook.name, enabled: playbook.reload.enabled, workflow_id: workflow.id, workflow_state: workflow.reload.state},
    counts: {contacts: business.contacts.count, messageable: business.contacts.where(messageable: true).count, subscribed: business.contacts.subscribed.count, messages: business.messages.count, enabled_playbooks: business.playbooks.where(enabled: true).count, active_workflows: business.workflows.active.count, composer_runs: CG::Composer::Run.count, composer_drafts: CG::Composer::Draft.count},
    job_adapter: ActiveJob::Base.queue_adapter.class.name, perform_deliveries: ActionMailer::Base.perform_deliveries,
    fixture_mutation: action == 'inspect' ? 'none' : 'update_columns on the existing synthetic playbook and workflow only; no callbacks, jobs or Saver invocation',
    no_outbound_execution: true, provider_values_printed: false,
  }
  File.write(directory.join("#{action}.json"), JSON.pretty_generate(output) + "\n")
  puts JSON.generate(output)
end
