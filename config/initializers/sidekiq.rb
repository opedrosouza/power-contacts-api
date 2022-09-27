# frozen_string_literal: true

Sidekiq.configure_server do |config|
  config.redis = { url: Rails.application.credentials.redis[:url], password: Rails.application.credentials.redis[:password] }
end

Sidekiq.configure_client do |config|
  config.redis = { url: Rails.application.credentials.redis[:url], password: Rails.application.credentials.redis[:password] }
end
