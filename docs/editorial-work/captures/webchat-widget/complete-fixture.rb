database = ActiveRecord::Base.connection.select_value('SELECT current_database()')
raise 'Unexpected database' unless database == 'hellotext_editorial_workload_20260928'
business = Business.find(5)
user = User.find_by!(email: 'design-system@example.test')
raise 'Unexpected demo business' unless business.handle == 'hellotext' && business.contacts.count == 127 && business.messages.count == 49
raise 'Unexpected demo owner' unless user.id == 1 && Privilege.where(business_id: 5, user_id: user.id, role: 'owner', discarded_at: nil).exists?
raise 'Enabled playbook found' if business.playbooks.kept.where(enabled: true).exists?
raise 'Deliverable contacts found' unless business.contacts.where(messageable: true).count.zero?
raise 'Subscribed contacts found' unless business.contacts.subscribed.count.zero?
puts({ database:, business_id: business.id, business_name: business.name,
  account: user.email, locale: user.locale, contacts: business.contacts.count,
  messageable: business.contacts.where(messageable: true).count,
  subscribers: business.contacts.subscribed.count, messages: business.messages.count,
  playbooks: business.playbooks.kept.pluck(:id, :type, :enabled),
  template: Playbook.find_by!(code: 'subscriber_booster', business: nil).id }.to_json)

raise 'Wrong Rails environment' unless Rails.env.development?
webchat = business.playbooks.kept.find_by!(type: 'Playbook::Webchat')
raise 'Unexpected fixture' unless webchat.id == 36 && !webchat.enabled? && webchat.workflow.nil?
expected = %w[Appearance Behaviour Sequence Teaser Handoff].map { "Playbook::Component::Webchat::#{it}" }
if webchat.components.count == expected.size && webchat.components.pluck(:component_type).sort == expected.sort
  puts({ action: 'already_complete', components: expected.size }.to_json)
else
  raise 'Unexpected partial fixture' unless webchat.components.none?
  template = Playbook.find_by!(business: nil, type: 'Playbook::Webchat', code: 'webchat_widget')
  source = template.components.where(component_type: expected).order(:position).to_a
  raise 'Incomplete template' unless source.map(&:component_type).sort == expected.sort
  source.each do |wrapper|
    component = wrapper.component
    raise 'Template attachments are not allowed' if component.respond_to?(:launcher_icon) && component.launcher_icon.attached?
    raise 'Unexpected template logo' if component.respond_to?(:header_logo) && component.header_logo.attached? && component.header_logo.filename.to_s != 'apple-touch-icon.jpg'
    raise 'Unexpected saved template messages' if component.respond_to?(:messages) && component.messages.any?
  end
  ActiveRecord::Base.transaction do
    source.each do |wrapper|
      original = wrapper.component
      component = original.is_a?(Playbook::Component::Webchat::Appearance) ? original.dup.tap(&:save!) : original.clone!
      webchat.components.create!(component:, position: wrapper.position)
    end
    raise 'Unsafe fixture after repair' if webchat.reload.enabled? || webchat.workflow.present? || business.contacts.where(messageable: true).any? || business.contacts.subscribed.any? || business.messages.count != 49
    puts({ action: 'completed_missing_components', components: webchat.components.count, enabled: webchat.enabled?, messages: 49, contacts: 127, messageable: 0, subscribers: 0 }.to_json)
  end
end
