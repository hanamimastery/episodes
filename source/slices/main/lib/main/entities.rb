# frozen_string_literal: true

# auto_register: false

module Main
  module Entities
  end
end

Dir[File.join(__dir__, 'entities', '*.rb')].each(&method(:require))
