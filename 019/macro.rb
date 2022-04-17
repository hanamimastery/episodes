# frozen_string_literal: true

require 'bundler/setup'
require 'irb'
require 'dry-schema'

schema1 = Dry::Schema.Params do
  required(:tags) { array? & each { str? } }
end

schema2 = Dry::Schema.Params do
  required(:tags).value(:array, min_size?: 2).each(:str?)
end

result = schema1.call(tags: tags)
result.success?
# => false
results.errors.to_h
# => { :tags=>{ 2=>["must be a string"] } }

IRB.start
