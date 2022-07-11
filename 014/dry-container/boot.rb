# frozen_string_literal: true

require 'bundler/setup'
require 'dry-container'
require 'irb'

require_relative 'lib/my_app/utils/loggers/io_logger'
require_relative 'lib/my_app/utils/services/subscriptions/email_subscription'
require_relative 'slices/blog/commands/become_awesome_subscriber'
require_relative 'system/container'

IRB.start
