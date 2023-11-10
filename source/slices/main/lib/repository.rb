# auto_register: false
# frozen_string_literal: true

require "welcome/repository"

module Main
  class Repository < Welcome::Repository
    struct_namespace Entities
  end
end
