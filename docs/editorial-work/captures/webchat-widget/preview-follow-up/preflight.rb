raise 'Wrong clone' unless Rails.env.development? && ActiveRecord::Base.connection.current_database=='hellotext_editorial_workload_20260928'
b=Business.find(5);u=User.find_by!(email:'design-system@example.test');p=b.playbooks.kept.find(36)
raise 'Wrong fixture' unless b.handle=='hellotext' && u.id==1 && p.is_a?(Playbook::Webchat) && !p.enabled? && p.workflow.nil? && p.components.count==5
raise 'Wrong owner' unless Privilege.where(business_id:5,user_id:u.id,role:'owner',discarded_at:nil).exists?
raise 'Unsafe baseline' unless b.contacts.count==127 && b.contacts.where(messageable:true).none? && b.contacts.subscribed.none? && b.messages.count==49 && b.playbooks.kept.where(enabled:true).none?
puts({database:ActiveRecord::Base.connection.current_database,account:u.email,business_id:b.id,business_name:b.name,locale:u.locale,webchat:p.hashed_id,enabled:p.enabled?,workflow:p.workflow&.id,components:p.components.count,contacts:127,messageable:0,subscribed:0,messages:49}.to_json)
