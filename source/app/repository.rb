# frozen_string_literal: true

require 'rom-repository'

module Sandbox
  class Repository < ROM::Repository::Root
    include Deps[container: 'persistence.rom']

    struct_namespace Entities

    commands :create, update: :by_pk

    def all
      root
    end

    def find(id)
      root.by_pk(id).one!
    end
  end
end
