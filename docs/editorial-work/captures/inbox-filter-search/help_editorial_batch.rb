raise 'Editorial runtime is development only' unless Rails.env.development?
raise 'Editorial runtime requires explicit opt-in' unless ENV['HELP_EDITORIAL_BATCH'] == 'task8-inbox-20261007'
raise 'Editorial runtime requires its own database' unless ENV['DATABASE_URL'] == 'postgresql:///hellotext_help_inbox_task8_20261007'
raise 'Editorial runtime requires its own Redis' unless ENV['REDIS_URL'] == 'redis://127.0.0.1:6418/0'

Rails.application.config.active_job.queue_adapter = :test
Rails.application.config.action_mailer.perform_deliveries = false
Rails.application.config.action_mailer.delivery_method = :test
Rails.application.config.active_storage.service = :local
Rails.application.config.action_view.annotate_rendered_view_with_filenames = false

Rails.application.config.after_initialize do
  ActiveJob::Base.queue_adapter = :test
  ActionMailer::Base.perform_deliveries = false
  ActionMailer::Base.delivery_method = :test
  Bullet.enable = false if defined?(Bullet)
  Bullet.add_footer = false if defined?(Bullet)
  Rack::MiniProfiler.config.enabled = false if defined?(Rack::MiniProfiler)
end
