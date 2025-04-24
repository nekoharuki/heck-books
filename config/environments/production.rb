# config/environments/production.rb

Rails.application.configure do
    config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?
    config.assets.compile = false
    config.log_level = :info
    config.require_master_key = true
  end
  