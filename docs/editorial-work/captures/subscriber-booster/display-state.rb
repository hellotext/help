raise 'Wrong Rails environment' unless Rails.env.development?
raise 'Wrong clone' unless ActiveRecord::Base.connection.current_database == 'hellotext_editorial_workload_20260928'
business = Business.find(5)
owner = User.kept.find_by!(email: 'design-system@example.test')
raise 'Wrong demo owner' unless business.handle == 'hellotext' && owner.id == 1 && Privilege.where(business_id: 5, user_id: owner.id, role: 'owner', discarded_at: nil).exists?
raise 'Unsafe contacts' unless business.contacts.count == 127 && business.contacts.where(messageable: true).none? && business.contacts.subscribed.none?
raise 'Unexpected messages' unless business.messages.count == 49
raise 'Unexpected saved Booster' if business.playbooks.kept.where(type: 'Playbook::SubscriberBooster').exists?
mode = ARGV.fetch(0)
states = { 'es' => ['es', 'Tienda Ejemplo'], 'en' => ['en', 'Example Store'], 'restore' => ['es', 'Enterprise'] }
locale, name = states.fetch(mode)
raise 'Unexpected starting display state' unless %w[es en].include?(owner.locale) && ['Enterprise', 'Tienda Ejemplo', 'Example Store'].include?(business.name)
owner.update_columns(locale:)
business.update_columns(name:)
raise 'Display state not applied' unless owner.reload.locale == locale && business.reload.name == name
raise 'Contacts or messages changed' unless business.contacts.where(messageable: true).none? && business.contacts.subscribed.none? && business.messages.count == 49
puts({ database: ActiveRecord::Base.connection.current_database, business_id: 5, account: owner.email, locale:, business_name: name, contacts: 127, messageable: 0, subscribers: 0, messages: 49, saved_boosters: 0 }.to_json)
