# frozen_string_literal: true

require 'bundler/setup'
require 'irb'
require 'dry-schema'

class OtherInfoSchema < Dry::Schema::Params
  define do
    required(:tags).value(:array, min_size?: 2).each(:str?)
  end
end

class UserSchema < Dry::Schema::Params
  define do
    required(:name).filled(:string)
    optional(:age).maybe(:integer)
    required(:other_info).schema(OtherInfoSchema.new)
  end
end

schema = UserSchema.new
result = schema.call(
  name: 'Seb',
  age: '19',
  other_info: { tags: [] }
)

IRB.start
