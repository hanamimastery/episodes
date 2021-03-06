# frozen_string_literal: true

require 'rom-factory'
require_relative 'helpers'

Factory = ROM::Factory.configure do |config|
  config.rom = Test::DB::Helpers.rom
end

Dir[Pathname(__FILE__).dirname.join('../../factories/**/*.rb')].each(&method(:require))
