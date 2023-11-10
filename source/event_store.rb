# frozen_string_literal: true

require 'securerandom'
require 'dry-struct'

module Types
  include Dry.Types()
end

class BaseEvent < Dry::Struct
  include Types
end

# ---------

class MoneySent < BaseEvent
  attribute :sender_id, Types::Strict::String.constrained(uuid_v4: true)
  attribute :reciever_id, Types::Strict::String.constrained(uuid_v4: true)
  attribute :currency, Types::String
  attribute :amount, Types::Strict::Decimal
end

require 'irb'
IRB.start
