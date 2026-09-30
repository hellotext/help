raise 'Wrong clone' unless Rails.env.development? && ActiveRecord::Base.connection.current_database=='hellotext_editorial_workload_20260928'
b=Business.find(5);u=User.find_by!(email:'design-system@example.test')
raise 'Wrong owner' unless b.handle=='hellotext' && u.id==1 && Privilege.where(business_id:5,user_id:1,role:'owner',discarded_at:nil).exists?
raise 'Unsafe fixture' unless b.contacts.count==127 && b.contacts.where(messageable:true).none? && b.contacts.subscribed.none? && b.messages.count==49 && b.playbooks.kept.where(enabled:true).none?
puts({database:ActiveRecord::Base.connection.current_database,business_id:5,account:u.email,locale:u.locale,contacts:b.contacts.count,messageable:0,subscribed:0,messages:b.messages.count,enabled_playbooks:0,events:b.tracked_events.count,actions:b.actions.kept.map { |a| [a.hashed_id,a.name,a.display_name,a.goal,a.passive] },profiles:b.contacts.limit(3).map { |c| [c.hashed_id,c.name] }}.to_json)
