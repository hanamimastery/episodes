# !/usr/bin/env ruby

require_relative './app'
require 'dry-inflector'

class CommandBus
  def register(command_klass, handler: nil)
    handler ||= init_handler(command_klass)
    handlers[command_klass] = handler
  end

  def call(cmd)
    handlers[cmd.klass.to_s].call(cmd)
  end

  private

  attr_reader :handlers, :inflector

  def initialize
    @handlers = {}
    @inflector = Dry::Inflector.new
  end

  # Initializes the handler based on command class
  # @param "String" i.e "App::Commands::CancelPayment
  # @return Instance of handler class, i.e: "App::"CommandHanlders::OnCancelPayment
  #
  def init_handler(command_klass)
    handler_klass_str =
      command_klass.split('::').tap do |items|
        items[items.index('Commands')] = 'CommandHandlers'
        items[-1] = "On#{items[-1]}"
      end.join('::')

    handler_klass = inflector.constantize(handler_klass_str)
    handler_klass.new
  end
end

bus = CommandBus.new
bus.register('App::Commands::CancelPayment')

p bus.method(:handlers).call
