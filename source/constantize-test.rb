#!/usr/bin/env ruby
# frozen_string_literal: true

require 'dry-inflector'
inflector = Dry::Inflector.new

class HanamiMastery
  def call
    p 'Subscribe'
  end
end

inflector.constantize('HanamiMastery').new.call
