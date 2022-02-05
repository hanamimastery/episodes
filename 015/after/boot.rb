# frozen_string_literal: true

require 'bundler/setup'
require 'irb'

require_relative 'system/container.rb'
require_relative 'lib/my_app/utils/loggers/io_logger.rb'
require_relative 'lib/my_app/utils/services/subscriptions/email_subscription.rb'
require_relative 'slices/blog/commands/become_awesome_subscriber.rb'

Container.register(
  'my_app.utils.logger',
  MyApp::Utils::Loggers::IOLogger.new
)

Container.register(
  'services.email_subscription',
  MyApp::Utils::Services::Subscriptions::EmailSubscription.new(
    logger: Container['my_app.utils.logger']
  )
)

Container.register(
  'commands.become_awesome_subscriber',
  Blog::Commands::BecomeAwesomeSubscriber.new(
    logger: Container['my_app.utils.logger'],
    service: Container['services.email_subscription']
  )
)

IRB.start
