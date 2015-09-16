<<<<<<< HEAD
=======
config.before_configuration do
  APP_CONFIG = YAML.load_file(File.expand_path('../config.yml', __FILE__))[Rails.env]
  config.cache_store = :redis_store, APP_CONFIG['redis']
end
>>>>>>> 1aafc0ba5cfb2ede418f1478344f62a76d849f00
require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'paper_trail'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
module Katesapp
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
    config.assets.initialize_on_precompile = false
<<<<<<< HEAD
    config.cache_store = :redis_store, 'redis://localhost:6379/0/cache'
=======
>>>>>>> 1aafc0ba5cfb2ede418f1478344f62a76d849f00

  end
end
