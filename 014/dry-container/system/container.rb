# frozen_string_literal: true

class Container
  extend Dry::Container::Mixin
end

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
