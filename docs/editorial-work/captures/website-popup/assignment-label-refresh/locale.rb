raise 'Wrong clone' unless Rails.env.development? && ActiveRecord::Base.connection.current_database=='hellotext_editorial_workload_20260928'
b=Business.find(5);u=User.find_by!(email:'design-system@example.test');p=Popup.find(1);c=p.capture
raise 'Wrong fixture' unless b.handle=='hellotext' && u.id==1 && p.hashed_id=='e9Z2LN51' && c.business_id==5 && c.draft? && p.hidden? && p.steps.count==2 && p.submissions.none? && c.coupon_id.nil? && c.journey_id.nil?
raise 'Wrong owner' unless Privilege.where(business_id:5,user_id:1,role:'owner',discarded_at:nil).exists?
raise 'Unsafe fixture' unless b.contacts.count==127 && b.contacts.where(messageable:true).none? && b.contacts.subscribed.none? && b.messages.count==49 && b.playbooks.kept.where(enabled:true).none?
locale=ARGV.fetch(0);raise 'Wrong locale' unless %w[es en].include?(locale)
u.update_columns(locale:locale)
puts({locale:u.reload.locale,hidden:p.hidden?,draft:c.draft?,submissions:0,messageable:0,subscribed:0,messages:49}.to_json)
