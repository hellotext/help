raise 'Wrong clone' unless Rails.env.development? && ActiveRecord::Base.connection.current_database == 'hellotext_editorial_workload_20260928'
b = Business.find(5)
u = User.find_by!(email: 'design-system@example.test')
raise 'Wrong owner' unless b.handle == 'hellotext' && u.id == 1 && Privilege.where(business_id: 5, user_id: 1, role: 'owner', discarded_at: nil).exists?
raise 'Unsafe fixture' unless b.contacts.count == 127 && b.contacts.where(messageable: true).none? && b.contacts.subscribed.none? && b.messages.count == 49 && b.tracked_events.count == 318 && b.playbooks.kept.where(enabled: true).none? && !Rails.application.config.action_mailer.perform_deliveries
puts({database: ActiveRecord::Base.connection.current_database, business_id: 5, business_public_id: b.hashed_id, business_name: b.name, account: u.email, locale: u.locale, contacts: 127, messageable: 0, subscribed: 0, messages: 49, events: 318, enabled_playbooks: 0, tokens: b.tokens.count}.to_json)
