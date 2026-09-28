# Local capture-only login for an already-created fictitious teammate.
# This runs only against the isolated, scrubbed clone and does not invoke mailers.
database = 'hellotext_editorial_workload_20260928'
email = 'editorial_workload_20260928_low_a@example.test'
raise 'Development only' unless Rails.env.development?
raise 'Wrong database configuration' unless ActiveRecord::Base.connection_db_config.database == database
raise 'Wrong active database' unless ActiveRecord::Base.connection.select_value('SELECT current_database()') == database
address = ActiveRecord::Base.connection.select_value('SELECT inet_server_addr()::text')
raise 'Database is not local' unless address.nil? || %w[127.0.0.1 ::1].include?(address)
raise 'Password missing' if ENV['EDITORIAL_CAPTURE_PASSWORD'].blank?

user = User.kept.find_by!(email:)
raise 'Wrong user population' unless User.kept.where(email:).count == 1
raise 'Wrong privilege' unless Privilege.where(business_id: 5, user_id: user.id, role: 'agent', discarded_at: nil).count == 1
raise 'Unexpected credential' if user.encrypted_password.present? || user.confirmed_at.present?
raise 'Unsafe contact population' unless Contact.where(business_id: 5, messageable: true).none?

user.update_columns(
  encrypted_password: Devise::Encryptor.digest(User, ENV.fetch('EDITORIAL_CAPTURE_PASSWORD')),
  confirmed_at: Time.current,
  # This synthetic clone user exists only for an isolated local UI capture.
  terms_accepted_at: Time.current,
  updated_at: Time.current
)
raise 'Login setup failed' unless user.reload.valid_password?(ENV.fetch('EDITORIAL_CAPTURE_PASSWORD')) && user.confirmed?
puts 'local_fixture_login_ready=true'
