# frozen_string_literal: true

require 'bundler/setup'
require 'irb'
require 'dry-schema'

schema = Dry::Schema.define do
  required(:name).filled(:string)
  optional(:age).maybe(:integer)
end

input = { name: nil, age: nil }
schema.call(input).success?
# => false
schema.call(input).errors.to_h
# => {:name=>["must be a string"]}

IRB.start
