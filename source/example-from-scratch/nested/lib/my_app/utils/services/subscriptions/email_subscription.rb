# frozen_string_literal: true

module MyApp
  module Utils
    module Services
      module Subscriptions
        class EmailSubscription
          attr_reader :logger

          def initialize(logger: MyApp::Utils::Loggers::IOLogger.new)
            @logger = logger
          end

          def call(_email)
            logger.call('@-_-@')
          end
        end
      end
    end
  end
end
