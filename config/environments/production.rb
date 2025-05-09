# config/environments/production.rb

Rails.application.configure do
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?
  config.assets.compile = false
  config.log_level = :info
  config.eager_load = true

  config.require_master_key = true
  config.hosts.clear
end
