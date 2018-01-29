require File.expand_path('../boot', __FILE__)

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Maybe
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    config.autoload_paths += Dir[Rails.root.join('app', 'models', '{*/}')]

    # Try loading a YAML file at `./config/env.[environment].yml`, if it exists
    # Kudos to Thomas Fuchs (http://mir.aculo.us) for the initial implementation
    def load_env_file(environment = nil)
      path = Rails.root.join("config", "env#{environment.nil? ? '' : '.'+environment}.yml")
      return unless File.exist? path
      config = YAML.load(ERB.new(File.new(path).read).result)
      config.each { |key, value| ENV[key.to_s] = value.to_s }
    end

    # Load environment variables. config/env.yml contains defaults which are
    # suitable for development. (This file is optional).
    load_env_file

    # Now look for custom environment variables, stored in env.[environment].yml
    # For development, this file is not checked into source control, so feel
    # free to tweak for your local development setup. Any values defined here
    # overwrite the defaults in `env.yml`
    load_env_file(Rails.env)
  end
end
