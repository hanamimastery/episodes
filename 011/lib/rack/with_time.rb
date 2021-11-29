# frozen_string_literal: true

require 'dry/effects'

module Rack
  class WithTime
    include Dry::Effects::Handler.CurrentTime

    def initialize(app)
      @app = app
    end

    def call(env)
      with_current_time do
        @app.call(env)
      end
    end
  end
end
