raise 'Wrong clone' unless Rails.env.development? && ActiveRecord::Base.connection.current_database == 'hellotext_editorial_workload_20260928'
b = Business.find(5)
u = User.find_by!(email: 'design-system@example.test')
raise 'Wrong owner' unless b.handle == 'hellotext' && u.id == 1 && Privilege.where(business_id: 5, user_id: 1, role: 'owner', discarded_at: nil).exists?
raise 'Unsafe fixture' unless b.contacts.count == 127 && b.contacts.where(messageable: true).none? && b.contacts.subscribed.none? && b.messages.count == 49 && b.tracked_events.count == 318 && b.playbooks.kept.where(enabled: true).none? && b.tokens.none?
puts({database: ActiveRecord::Base.connection.current_database, business_id: b.id, account: u.email, locale: u.locale, contacts: 127, messageable: 0, subscribed: 0, messages: 49, events: 318, enabled_playbooks: 0, tokens: 0, blueprints: b.blueprints.kept.map { |bp| {id: bp.id, public_id: bp.hashed_id, kind: bp.kind, name: bp.name, title: bp.title, entities: bp.entities.kept.count, properties: bp.properties.map { |p| [p.id, p.identifier, p.kind, p.required, p.unique?] }} }}.to_json)
