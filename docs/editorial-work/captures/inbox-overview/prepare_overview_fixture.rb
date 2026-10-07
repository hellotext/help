load Rails.root.join('tmp/verify_safety.rb')
business = Business.find(5)
raise 'Fixture already exists' if business.messages.where("metadata ->> 'editorial_fixture' = ?", 'inbox-overview-task8').exists?
created = []
ActiveRecord::Base.transaction do
  { 11 => 'Hi, can you help me choose the right size for this jacket?', 13 => 'Hi, is this backpack available in blue?' }.each do |id, body|
    conversation = business.conversations.find(id)
    contact = conversation.contact
    raise 'Wrong fictional contact' unless contact.id == id && !contact.messageable?
    message = Message.create!(business:, contact:, technology: Technology.webchat, state: :received, body:, user: nil, deliver: false, metadata: { editorial_fixture: 'inbox-overview-task8', demonstration: true }, created_at: 8.minutes.ago, state_updated_at: 8.minutes.ago)
    event = Event.create!(conversation:, eventable: message, creator: contact, original_created_at: message.created_at)
    conversation.update_columns(last_event_id: event.id, last_active_event_at: event.original_created_at)
    created << { type: 'incoming', message_id: message.id, conversation_id: conversation.id, route: conversation.hashed_id }
  end
  conversation = business.conversations.find(11)
  note = Note.create!(conversation:, body: 'Check the size guide before replying. The customer prefers a relaxed fit.', metadata: { editorial_fixture: 'inbox-overview-task8' }, created_at: 5.minutes.ago)
  event = Event.create!(conversation:, eventable: note, creator: User.find(1), original_created_at: note.created_at)
  conversation.update_columns(last_event_id: event.id, last_active_event_at: event.original_created_at)
  created << { type: 'internal_note', note_id: note.id, conversation_id: conversation.id }
end
puts JSON.pretty_generate({ records: created, outbound_messages: 0, sends_executed: 0, provider_connections: 0, messages_after: business.messages.count })
