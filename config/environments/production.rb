config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?
config.assets.compile = false # trueにすると事前ビルド不要だが非推奨
config.log_level = :info
