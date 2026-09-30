raise 'Wrong clone' unless Rails.env.development? && ActiveRecord::Base.connection.current_database=='hellotext_editorial_workload_20260928'
b=Business.find(5);u=User.find_by!(email:'design-system@example.test')
raise 'Wrong owner' unless b.handle=='hellotext' && u.id==1 && Privilege.where(business_id:5,user_id:1,role:'owner',discarded_at:nil).exists?
raise 'Unsafe fixture' unless b.contacts.count==127 && b.contacts.where(messageable:true).none? && b.contacts.subscribed.none? && b.messages.count==49 && b.playbooks.kept.where(enabled:true).none? && Playbook::PropertyCollector.where(business:b).none?
l=ARGV.fetch(0);raise 'Wrong locale' unless %w[es en].include?(l);u.update_columns(locale:l)
puts({database:ActiveRecord::Base.connection.current_database,business_id:5,account:u.email,locale:u.reload.locale,contacts:127,messageable:0,subscribed:0,messages:49,enabled_playbooks:0,collector_playbooks:0}.to_json)
