# frozen_string_literal: true

require 'bundler/setup'
require 'irb'

class Logger
  def call(msg)
    puts msg
  end
end

class EmailSubscriptionService
  attr_reader :logger
  def initialize(logger: Logger.new)
    @logger = logger
  end

  def call(email)
    logger.call("@-_-@")
  end
end

class BecomeAwesomeSubscriber
  attr_reader :logger, :service
  def initialize(
    logger: Logger.new,
    service: EmailSubscriptionService.new
  )
    @logger = logger
    @service = service
  end

  def call(email)
    logger.call("starting subscription...")
    service.call(email)
    logger.call("subscribed to newsletter!")
  end
end

require 'objspace'
IRB.start
