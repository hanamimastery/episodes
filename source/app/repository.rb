# frozen_string_literal: true

require 'rom-repository'

module Sandbox
  class Repository < ROM::Repository::Root
    include Deps[container: 'persistence.rom']

    commands :create
  end
end
