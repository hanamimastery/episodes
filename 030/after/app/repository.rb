# frozen_string_literal: true

require 'rom-repository'

module Sandbox
  class Repository < ROM::Repository::Root
    include Deps[container: 'persistence.rom']

    struct_namespace Entities

    commands :create

    def all
      root
    end
  end
end
