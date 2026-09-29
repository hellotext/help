database = ActiveRecord::Base.connection.select_value('SELECT current_database()')
raise 'Unexpected database' unless database == 'hellotext_editorial_workload_20260928'
business = Business.find(5)
user = User.find_by!(email: 'design-system@example.test')
raise 'Unexpected demo business' unless business.handle == 'hellotext'
raise 'Deliverable contacts found' unless business.contacts.where(messageable: true).count.zero?
raise 'Subscribed contacts found' unless business.contacts.subscribed.count.zero?
puts({ database:, business_id: business.id, business_name: business.name,
  account: user.email, locale: user.locale, contacts: business.contacts.count,
  messageable: business.contacts.where(messageable: true).count,
  subscribers: business.contacts.subscribed.count, messages: business.messages.count,
  playbooks: business.playbooks.kept.pluck(:id, :type, :enabled),
  template: Playbook.find_by!(code: 'subscriber_booster', business: nil).id }.to_json)
