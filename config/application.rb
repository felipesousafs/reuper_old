require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Reuper
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.i18n.default_locale = :'pt-BR'
    config.time_zone = 'Brasilia'

    config.assets.paths << Rails.root.join("vendor", "assets", "fonts")

    config.middleware.use PDFKit::Middleware
  end
end
