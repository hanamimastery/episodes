# frozen_string_literal: true

module Blog
  module Commands
    class BecomeAwesomeSubscriber
      attr_reader :logger, :service

      def initialize(
        logger: MyApp::Utils::Loggers::IOLogger.new,
        service: MyApp::Utils::Services::Subscriptions::EmailSubscription.new
      )
        @logger = logger
        @service = service
      end

      def call(email)
        logger.call('starting subscription...')
        service.call(email)
        logger.call('subscribed to newsletter!')
      end
    end
  end
end
