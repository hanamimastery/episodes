# frozen_string_literal: true

require 'bundler/setup'
require 'irb'

require_relative 'lib/my_app/utils/loggers/io_logger.rb'
require_relative 'lib/my_app/utils/services/subscriptions/email_subscription.rb'
require_relative 'slices/blog/commands/become_awesome_subscriber.rb'

require 'objspace'
IRB.start
