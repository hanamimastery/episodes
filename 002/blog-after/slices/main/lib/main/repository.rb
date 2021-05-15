# frozen_string_literal: true

require "sandbox/repository"
require_relative "entities"

module Main
  class Repository < Sandbox::Repository
    struct_namespace Entities
  end
end
