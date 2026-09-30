load File.join(__dir__, 'fixture-preflight.rb')
b=Business.find(5)
before=[b.messages.count,b.tracked_events.count,b.contacts.count]
a=b.custom_actions.kept.find_by(name:'appointment.booked')
raise 'Unexpected custom definitions' unless b.custom_actions.kept.count==(a ? 1 : 0)
if a
  raise 'Changed demonstration action' unless a.display_name=='Cita reservada' && !a.goal? && a.passive? && a.tracked_events.none?
else
  a=Track::Action::Custom.create!(business:b,name:'appointment.booked',display_name:'Cita reservada',goal:false,passive:true)
end
raise 'Unexpected activity or delivery' unless before==[b.messages.count,b.tracked_events.count,b.contacts.count] && b.playbooks.kept.where(enabled:true).none? && b.contacts.where(messageable:true).none? && b.contacts.subscribed.none?
puts({fixture:a.hashed_id,name:a.name,title:a.display_name,goal:a.goal,passive:a.passive,events:a.tracked_events.count,protected_counts:before}.to_json)
