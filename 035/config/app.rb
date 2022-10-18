# frozen_string_literal: true

require "hanami"
require_relative "../lib/sandbox/middleware/current_time"

module Sandbox
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
