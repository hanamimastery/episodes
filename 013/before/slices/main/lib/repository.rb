# auto_register: false
# frozen_string_literal: true

require "sandbox/repository"

module Main
  class Repository < Sandbox::Repository
    struct_namespace Entities
  end
end
