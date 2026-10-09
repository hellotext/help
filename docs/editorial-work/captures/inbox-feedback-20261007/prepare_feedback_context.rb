load Rails.root.join('tmp/verify_safety.rb')

tag = 'inbox-feedback-context-20261007'
business = Business.find(5)
owner = User.find_by!(email: 'design-system@example.test')
teammate = User.find(2)
raise 'Unexpected demo teammate' unless teammate.email.end_with?('@example.test')
raise 'Unexpected business scope' unless [owner.id, teammate.id].all? { business.users.exists?(it) }
raise 'Push subscriptions exist' unless PushSubscription.count.zero?
raise 'Queued jobs would execute' if ActiveJob::Base.queue_adapter.perform_enqueued_jobs || ActiveJob::Base.queue_adapter.perform_enqueued_at_jobs
raise 'Worker runtime is not allowed' if Sidekiq.server?
raise 'Existing context fixture; do not create twice' if Contact.where("metadata ->> 'editorial_fixture' = ?", tag).exists?

before = { messages: Message.count, business_messages: business.messages.count, contacts: Contact.count, conversations: Conversation.count }
baseline_activity = business.conversations.where(id: [11, 12]).minimum(:last_active_event_at)
raise 'Missing baseline activity' unless baseline_activity
names = [['Valentina', 'Ríos'], ['Mateo', 'Silva'], ['Camila', 'Torres'], ['Diego', 'Navarro'], ['Paula', 'Medina'], ['Nicolás', 'Vega']]
created = []

Current.set(user: owner, business:) do
  ActiveRecord::Base.transaction do
    names.each.with_index do |(first_name, last_name), index|
      contact = business.contacts.create!(first_name:, last_name:, messageable: false,
        subscription_state: 'unconfirmed', aliases: [], metadata: { editorial_fixture: tag })
      activity = baseline_activity - (index + 1).minutes
      assignee = index.even? ? owner : teammate
      conversation = business.conversations.build(contact:, metadata: { editorial_fixture: tag })
      conversation.skip_inbox_broadcast = true
      conversation.save!
      conversation.update_columns(state: 'assigned', old_state: nil, assigned_user_id: assignee.id,
        state_changed_at: activity, last_active_event_at: activity)
      raise 'Initial fictional owner mismatch' unless conversation.reload.assigned? && conversation.assigned_user_id == assignee.id
      raise 'Contact gained a delivery identity' if contact.messageable? || contact.contactables.exists?
      raise 'Conversation gained an AI agent' if conversation.agents.exists?
      created << { contact_id: contact.id, conversation_id: conversation.id, name: contact.name,
                   assigned_user_id: assignee.id, state: conversation.state, last_active_event_at: activity }
    end
    raise 'Unexpected new message' unless Message.count == before[:messages] && business.messages.count == before[:business_messages]
    raise 'Incorrect fixture size' unless Contact.count == before[:contacts] + 6 && Conversation.count == before[:conversations] + 6
  end
end

load Rails.root.join('tmp/verify_safety.rb')
record = { fixture: tag, purpose: 'Native conversation rows behind open filters and in the full Inbox overview',
           before:, created:, business_messages_after: business.messages.count, database_messages_after: Message.count,
           deliveries_executed: 0, endpoints_added: 0, roles_or_permissions_changed: false, configuration_changed: false,
           note: 'Assigned state is initial fictional source data; no assignment workflow result is claimed.' }
File.write(Rails.root.join('tmp/feedback-context-fixture.json'), JSON.pretty_generate(record) + "\n")
puts JSON.pretty_generate(record)
