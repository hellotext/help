raise 'Wrong clone' unless Rails.env.development? && ActiveRecord::Base.connection.current_database=='hellotext_editorial_workload_20260928'
b=Business.find(5);u=User.find_by!(email:'design-system@example.test')
popup=Popup.find(1);capture=popup.capture
raise 'Wrong fixture' unless b.handle=='hellotext' && u.id==1 && popup.hashed_id=='e9Z2LN51' && capture.business_id==5 && capture.draft? && popup.hidden? && popup.steps.count==2 && popup.submissions.none? && capture.coupon_id.nil? && capture.journey_id.nil?
raise 'Wrong owner' unless Privilege.where(business_id:5,user_id:1,role:'owner',discarded_at:nil).exists?
raise 'Unsafe baseline' unless b.contacts.count==127 && b.contacts.where(messageable:true).none? && b.contacts.subscribed.none? && b.messages.count==49 && b.playbooks.kept.where(enabled:true).none?
puts({database:ActiveRecord::Base.connection.current_database,account:u.email,business_id:b.id,business_name:b.name,locale:u.locale,popup:popup.hashed_id,hidden:popup.hidden?,state:capture.state,steps:popup.steps.count,submissions:0,contacts:127,messageable:0,subscribed:0,messages:49,header_attached:popup.overlay_background_image.attached?,header:popup.steps.first.header.content.to_s}.to_json)
