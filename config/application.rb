require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
require "fileutils"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TulOhist
  class Application < Rails::Application
    
    config.generators do |g|
      g.test_framework :rspec, :spec => true
    end


    
    config.generators do |g|
      g.test_framework :rspec, :spec => true
    end
    
    # Custom directories with classes and modules you want to be autoloadable.
    config.autoload_paths += %W(#{config.root}/lib)
    config.autoload_paths += %W(#{config.root}/app/models/datastreams)
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
 
    # Create log files
    tul_ohist_config = YAML.load_file(File.expand_path("#{Rails.root}/config/tul_ohist.yml", __FILE__))
    FileUtils.touch(File.join(Rails.root, 'log', tul_ohist_config['cron_error_log']))
    FileUtils.touch(File.join(Rails.root, 'log', tul_ohist_config['cron_log']))
    FileUtils.touch(File.join(Rails.root, 'log', tul_ohist_config['ingest_log']))
  end
end
