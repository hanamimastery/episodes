# frozen_string_literal: true

module MyApp
  module Utils
    module Services
      module Subscriptions
        class EmailSubscription
          attr_reader :logger
          def initialize(logger:)
            @logger = logger
          end

          def call(email)
            logger.call("@-_-@")
          end
        end
      end
    end
  end
end
