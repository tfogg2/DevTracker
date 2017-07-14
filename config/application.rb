require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DevTrack
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1


    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
  class ConversationActionCable
    def initialize(app, options={})
      @app = app
    end

    def call(env)
      if Faye::WebSocket.websocket?(env)
        ActionCable.server.call(env)
      else
        @app.call(env)
      end
    end
  end
end
