load File.join(__dir__, 'fixture-preflight.rb')
b=Business.find(5);u=User.find_by!(email:'design-system@example.test');a=b.custom_actions.kept.find_by!(name:'appointment.booked')
raise 'Unexpected action fixture' unless b.custom_actions.kept.count==1 && a.tracked_events.none? && !a.goal? && a.passive? && b.tracked_events.count==318
l=ARGV.fetch(0);raise 'Invalid locale' unless %w[es en].include?(l)
u.update_columns(locale:l);a.update_columns(display_name:l=='es' ? 'Cita reservada' : 'Appointment booked')
puts({locale:l,action:a.hashed_id,name:a.name,display_name:a.reload.display_name,messages:49,events:318,contacts:127,messageable:0,subscribed:0,enabled_playbooks:0}.to_json)
