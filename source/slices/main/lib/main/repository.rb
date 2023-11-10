# frozen_string_literal: true

require 'hanami_mastery/repository'
require_relative 'entities'

module Main
  class Repository < HanamiMastery::Repository
    struct_namespace Entities
  end
end
