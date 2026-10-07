load Rails.root.join('tmp/verify_safety.rb')
locale = ARGV.fetch(0)
raise 'Unsupported local fixture locale' unless %w[es en].include?(locale)
texts = {
  'es' => { 11 => 'Hola, ¿pueden ayudarme a elegir la talla de esta chaqueta?', 13 => 'Hola, ¿esta mochila está disponible en azul?', note: 'Revisa la guía de tallas antes de responder. La clienta prefiere un ajuste holgado.' },
  'en' => { 11 => 'Hi, can you help me choose the right size for this jacket?', 13 => 'Hi, is this backpack available in blue?', note: 'Check the size guide before replying. The customer prefers a relaxed fit.' }
}.fetch(locale)
Message.where("metadata ->> 'editorial_fixture' = ?", 'inbox-overview-task8').find_each { it.update!(body: texts.fetch(it.contact_id)) }
Note.where("metadata ->> 'editorial_fixture' = ?", 'inbox-overview-task8').find_each { it.update!(body: texts.fetch(:note)) }
User.find_by!(email: 'design-system@example.test').update_columns(locale:)
puts JSON.generate({ locale:, fixture_messages: 2, outbound_messages: 0, sends_executed: 0 })
