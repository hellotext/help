load File.join(__dir__, 'fixture-preflight.rb')
l = ARGV.first
raise 'Invalid locale' unless %w[es en].include?(l)
b = Business.find(5)
bp = b.blueprints.kept.find_by!(name: 'appointment')
raise 'Wrong fixture' unless bp.hashed_id == 'l3QqYQag' && bp.entities.kept.count == 1 && bp.entities.sole.tracked_events.none? && bp.properties.count == 3
User.find_by!(email: 'design-system@example.test').update_columns(locale: l)
bp.update_columns(title: l == 'es' ? 'Citas' : 'Appointments')
room = bp.entities.sole.properties.find_by!(identifier: 'room')
room.update!(element: Property::Text.find_or_create_by!(value: l == 'es' ? 'Sala 3' : 'Room 3'))
load File.join(__dir__, 'fixture-preflight.rb')
