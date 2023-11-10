# frozen_string_literal: true

require 'bundler/setup'
require 'irb'
require 'dry-schema'

schema = Dry::Schema.Params do
  required(:name).filled(:string)
  required(:age).filled(:integer)
end

input = { name: 'Seb', age: '19' }
result = schema.call(input)

result.success?
# => true
result.to_h
# => { name: 'Seb', age: 19 } # notice it's not string anymore

IRB.start
