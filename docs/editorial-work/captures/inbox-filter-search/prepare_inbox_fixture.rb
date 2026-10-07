load Rails.root.join('tmp/verify_safety.rb')
business = Business.find(5)
owner = User.find_by!(email: 'design-system@example.test')
ActiveRecord::Base.transaction do
  [[11, owner.id], [12, 2], [13, nil]].each do |id, assigned_user_id|
    conversation = business.conversations.find(id)
    raise 'Unexpected fictional contact' unless conversation.contact_id == id && !conversation.contact.messageable?
    conversation.update_columns(state: assigned_user_id ? 'assigned' : 'unassigned', assigned_user_id:, last_active_event_at: Time.current)
  end
  priority = business.labels.find(5)
  [11, 12].each do |id|
    LabelItem.find_or_create_by!(label: priority, labelable: business.conversations.find(id))
  end
  %w[Devoluciones Ventas].each { business.labels.find_or_create_by!(name: it) }
end
puts JSON.pretty_generate({changed_conversations: [11, 12, 13], names: business.conversations.where(id: [11, 12, 13]).map { [it.contact.name, it.state, it.assigned_user_id] }, labels: business.labels.map { [it.id, it.name] }, sends_executed: 0, fixture_only: true})
load Rails.root.join('tmp/verify_safety.rb')
