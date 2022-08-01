# frozen_string_literal: true

require "hanami"

module Hanami
  # Hanami Rack middleware
  #
  # @since 1.3.0
  module Middleware
    # Base error for Rack middleware
    #
    # @since 2.0.0
    class Error < ::StandardError
    end
  end
end

module Sandbox
  class App < Hanami::App
    # Add a custom middleware to return SCIM validation errors if JSON body
    # parsing fails (relates to the BodyParser middleware below)
    #
    # TODO: make this nice, somehow

    # Tell the the JSON body parser it can be used for application/scim+json
    # requests too
    #
    # TODO: remove this once this is properly configurable within Hanami
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
