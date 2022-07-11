# frozen_string_literal: true

require 'dry/effects'

module Rack
  class Locale
    include Dry::Effects::Handler.Reader(:locale)

    SUPPORTED = %w[en sw].freeze
    DEFAULT = 'en'
    def initialize(app)
      @app = app
    end

    def call(env)
      with_locale(detect_locale(env)) do
        @app.call(env)
      end
    end

    private

    def detect_locale(env)
      given_locale = Rack::Request.new(env).params['locale']
      SUPPORTED.detect { |l| l == given_locale } || DEFAULT
    end
  end
end
