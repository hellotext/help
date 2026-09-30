load File.join(__dir__, 'fixture-preflight.rb')
b = Business.find(5)
raise 'Existing custom structure' unless b.blueprints.kept.custom.none?
blueprint = nil
ActiveRecord::Base.transaction do
  blueprint = Artifact::Blueprint::Type::Custom.create!(business: b, title: 'Citas', name: 'appointment')
  reference = blueprint.properties.create!(kind: 'text', name: 'reference', required: true, is_unique: true, position: 1)
  room = blueprint.properties.create!(kind: 'text', name: 'room', required: false, is_unique: false, position: 2)
  fee = blueprint.properties.create!(kind: 'money', name: 'fee', required: false, is_unique: false, position: 3)
  blueprint.update!(default_money_property: fee)
  params = {properties: {reference.hashed_id => {value: 'APT-1042'}, room.hashed_id => {value: 'Sala 3'}, fee.hashed_id => {amount: '89.90', currency: 'USD'}}}
  entity = Artifact::EntityService.new(business: b, blueprint:, params:).create
  raise 'Invalid fictional instance' unless entity.persisted? && entity.errors.none? && entity.properties.count == 3 && entity.tracked_events.none?
  raise 'Unexpected side effect' unless b.contacts.count == 127 && b.messages.count == 49 && b.tracked_events.count == 318 && b.tokens.none? && b.playbooks.kept.where(enabled: true).none?
end
puts({fixture: blueprint.hashed_id, instance: blueprint.entities.sole.hashed_id, properties: blueprint.properties.map { |p| [p.hashed_id, p.identifier, p.kind, p.required, p.unique?] }, events: 0}.to_json)
load File.join(__dir__, 'fixture-preflight.rb')
