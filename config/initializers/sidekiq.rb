require 'sidekiq'

Sidekiq.configure_server do |config|
    config.redis = {
      url: "redis://192.xxx.xxx.xxx:6379/12"
    }
  end
  
  Sidekiq.configure_client do |config|
    config.redis = {
      url: "redis://192.xxx.xxx.xxx:6379/12"
    }
  end