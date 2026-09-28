# Local, callback-free source data for the customer-profiles Help screenshots.
# Run from the Rails snapshot used by the local demo server:
#   RAILS_ENV=development DATABASE_URL=postgresql:///hellotext_editorial_capture_20260926 \
#     bin/rails runner /absolute/path/to/this/file
# The transaction refuses other databases, businesses, contacts, or fixture states.
# It adds no message, tracked event, campaign, delivery job, or consent change.

expected_database = 'hellotext_editorial_capture_20260926'
fixture_tag = 'customer_profiles_camila_20260928'
email_address = 'camila.torres@example.test'
company_name = 'Tienda Aurora · Ejemplo'
event_ids = [329, 339, 343]

raise 'Development only' unless Rails.env.development?
raise 'Wrong database' unless ActiveRecord::Base.connection.select_value('SELECT current_database()') == expected_database

ActiveRecord::Base.transaction do
  business = Business.find_by!(id: 5, handle: 'hellotext')
  raise 'Wrong demonstration business' unless business.name == 'Enterprise' &&
    business.timezone == 'Montevideo' &&
    business.reporting_currency == 'USD' &&
    business.metadata['design_system_fixture'] == true

  contact = Contact.find_by!(id: 7, business_id: business.id)
  raise 'Wrong demonstration contact' unless contact.first_name == 'Camila' &&
    contact.last_name == 'Torres' &&
    contact.display_name == 'Camila Torres' &&
    contact.metadata['design_system_report_fixture'] == true &&
    contact.metadata['fixture_key'] == 'design_system_reports_operations_contact_0' &&
    contact.state == 'active' &&
    contact.subscription_state == 'unconfirmed' &&
    !contact.messageable? &&
    contact.discarded_at.nil? &&
    contact.last_activity_at.nil?

  raise 'Profile already has attributes' if Contact::Attribute.where(business_id: business.id, contact_id: contact.id).exists?
  raise 'A channel is active' if Channel.where(business_id: business.id).where.not(status: 'inactive').exists?
  raise 'A playbook is enabled' if Playbook.where(business_id: business.id, enabled: true).exists?
  raise 'A workflow is enabled' if Automation::Workflow.where(business_id: business.id).where.not(state: 'disabled').exists?

  audience = Contact.where(business_id: business.id, state: %w[active unverified]).kept
  raise 'Audience activity baseline changed' if audience.where.not(last_activity_at: nil).exists?

  action = Track::Action.find_by!(id: 27, name: 'order.placed', exposed: true)
  events = Track::Event.where(id: event_ids, business_id: business.id, contact_id: contact.id, action_id: action.id, discarded_at: nil).order(:tracked_at).to_a
  raise 'Synthetic activity changed' unless events.map(&:id).sort == event_ids &&
    events.map { |event| event.tracked_at.in_time_zone(business.timezone).to_date } == [Date.new(2026, 9, 13), Date.new(2026, 9, 18), Date.new(2026, 9, 19)] &&
    events.all? { |event| event.tracked_at >= business.reporting.delay_time_ago }

  properties = Business::Property.where(business_id: business.id, kind: %w[email address company birthday], discarded_at: nil).index_by(&:kind)
  raise 'Profile property definitions changed' unless properties.keys.sort == %w[address birthday company email]
  raise 'Fixture email already exists' if Email.exists?(address: email_address)
  raise 'Fixture company already exists' if Property::Text.exists?(type: 'Property::Text', value: company_name)
  raise 'Fixture birthday already exists' if Property::Date.exists?(day: 12, month: 4, year: 1994)
  raise 'Fixture address already exists' if Property::Address.where("metadata->>'editorial_fixture' = ?", fixture_tag).exists?

  original_message_count = Message.where(business_id: business.id, contact_id: contact.id).count
  original_event_count = Track::Event.where(business_id: business.id, contact_id: contact.id).count

  email_id = Email.insert_all!([{ address: email_address }], returning: [:id]).rows.fetch(0).fetch(0)
  address_id = Property::Address.insert_all!([{
    street: 'Calle Ejemplo',
    number: '123',
    city: 'Montevideo',
    country_id: business.country_id,
    analyzed_at: Time.current,
    metadata: { editorial_fixture: fixture_tag },
  }], returning: [:id]).rows.fetch(0).fetch(0)
  company_id = Property::Text.insert_all!([{ type: 'Property::Text', value: company_name }], returning: [:id]).rows.fetch(0).fetch(0)
  birthday_id = Property::Date.insert_all!([{ day: 12, month: 4, year: 1994 }], returning: [:id]).rows.fetch(0).fetch(0)

  values = [
    ['email', 'Email', email_id, false],
    ['address', 'Property::Address', address_id, true],
    ['company', 'Property::Text', company_id, true],
    ['birthday', 'Property::Date', birthday_id, true],
  ]
  attributes = values.map do |kind, element_type, element_id, verified|
    property = properties.fetch(kind)
    {
      type: 'Contact::Attribute',
      business_id: business.id,
      contact_id: contact.id,
      property_id: property.id,
      kind:,
      element_type:,
      element_id:,
      position: property.position,
      is_unique: property.uniq?,
      verified:,
      internal_metadata: { editorial_fixture: fixture_tag },
    }
  end
  Contact::Attribute.insert_all!(attributes)

  latest_activity = events.last.tracked_at
  changed = Contact.where(id: contact.id, business_id: business.id, last_activity_at: nil).update_all(last_activity_at: latest_activity)
  raise 'Could not set the existing activity date' unless changed == 1

  contact.reload
  visible_properties = Profile::Header::Preloader.new(business:, contact:).property_values_for(contact)
  raise 'Profile header does not show the four values' unless visible_properties.map(&:kind) == %w[phone email address company birthday] &&
    visible_properties.drop(1).all? { |value| value.element.present? }
  raise 'Camila is not the first Audience row' unless audience.order_by(nil).first.id == contact.id
  raise 'Profile state changed' unless contact.display_name == 'Camila Torres' && contact.subscription_state == 'unconfirmed' && !contact.messageable?
  raise 'Existing activity changed' unless Track::Event.where(business_id: business.id, contact_id: contact.id).count == original_event_count
  raise 'Messages changed' unless Message.where(business_id: business.id, contact_id: contact.id).count == original_message_count
  raise 'Fixture attribute count changed' unless Contact::Attribute.where(business_id: business.id, contact_id: contact.id).where("internal_metadata->>'editorial_fixture' = ?", fixture_tag).count == 4

  puts "Prepared #{contact.display_name} (#{contact.hashed_id}): first Audience row, four filled profile values, three recent existing order events."
end
