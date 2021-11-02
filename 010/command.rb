# frozen_string_literal: true

require 'securerandom'
require 'dry-struct'

module Types
  include Dry.Types()
end

class SubscribeToHanamiMastery
  class Schema < Dry::Struct
    include Types

    attribute :subscriber_id, Types::Strict::String.constrained(uuid_v4: true)
    attribute :email, Types::Strict::String
  end

  def call(input)
    schema = Schema.new(input)

    # your fancy newsletter subscription logic
    puts "You've successfully subscribed to HanamiMastery!"
  end
end

require 'irb'
IRB.start
