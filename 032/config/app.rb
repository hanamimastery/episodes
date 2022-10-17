# frozen_string_literal: true

require "hanami"
require "dry/effects"

module Sandbox
  module Middleware
    class CurrentTime
      include Dry::Effects::Handler.CurrentTime

      def initialize(app)
        @app = app
      end

      def call(env)
        # It will use Time.now internally once and set it fixed
        with_current_time do
          @app.(env)
        end
      end
    end
  end

  class App < Hanami::App
    config.middleware.use Middleware::CurrentTime

    require "hanami/middleware/body_parser"
    require "hanami/middleware/body_parser/json_parser"
    class Hanami::Middleware::BodyParser::JsonParser
      def mime_types
        ["application/json", "application/vnd.api+json"]
      end
    end
    config.middleware.use Hanami::Middleware::BodyParser, :json
  end
end
