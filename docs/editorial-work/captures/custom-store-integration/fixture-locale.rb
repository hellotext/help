load File.join(__dir__, 'fixture-preflight.rb')
b = Business.find(5)
u = User.find_by!(email: 'design-system@example.test')
raise 'Unexpected token count' unless b.tokens.none?
l = ARGV.fetch(0)
raise 'Invalid locale' unless %w[es en].include?(l)
u.update_columns(locale: l)
puts({locale: l, tokens: 0, contacts: 127, messages: 49, events: 318, enabled_playbooks: 0}.to_json)
