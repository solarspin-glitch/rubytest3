require "active_support/core_ext/integer/time"

Rails.application.configure do
  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local = true
  config.server_timing = true
  config.action_controller.perform_caching = false
  config.cache_store = :null_store
  config.public_file_server.enabled = true
  config.active_support.deprecation = :log
  config.active_support.disallowed_deprecation = :raise
  config.assets.debug = true
  config.assets.quiet = true
end
