raise 'Wrong environment' unless Rails.env.development? && ActiveRecord::Base.connection.current_database == 'hellotext_editorial_workload_20260928'
b=Business.find(5); u=User.find_by!(email: 'design-system@example.test');f=Artifact::Form.find_by!(hashed_id: '3oDXBQG4')
raise 'Wrong owner' unless b.handle=='hellotext' && u.id==1 && Privilege.where(business_id:5,user_id:1,role:'owner',discarded_at:nil).exists?
raise 'Unsafe contacts' unless b.contacts.count==127 && b.contacts.where(messageable:true).none? && b.contacts.subscribed.none?
raise 'Enabled playbook' if b.playbooks.kept.where(enabled:true).exists?
raise 'Unsafe form' unless f.business.id==5 && f.capture.draft? && f.submissions.none? && !f.capture.coupon_id? && !f.capture.journey_id?
s=f.steps.first
puts({database:ActiveRecord::Base.connection.current_database,account:u.email,locale:u.locale,contacts:b.contacts.count,messageable:0,subscribed:0,messages:b.messages.count,form:f.hashed_id,state:f.capture.state,submissions:f.submissions.count,header:s.header.content.to_s,header_metadata:s.header.metadata,footer:s.footer.content.to_s,footer_metadata:s.footer.metadata,label:s.inputs.first.label,placeholder:s.inputs.first.placeholder,button:s.button.text}.to_json)
