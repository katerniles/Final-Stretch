require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'paper_trail'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
config.cache_store = :redis_store, 'redis://localhost:6379/0/cache'
module Katesapp
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
    config.assets.initialize_on_precompile = false

  end
end
