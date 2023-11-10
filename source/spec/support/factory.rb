# frozen_string_literal: true

require "rom-factory"
require "faker"

Factory = ROM::Factory.configure do |config|
  config.rom =
    Sandbox::App.container['persistence.rom']
end

Dir[File.dirname(__FILE__) + '/factories/*.rb'].
  each { |file| require file }
