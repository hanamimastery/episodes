# frozen_string_literal: true

module Sandbox
  class Event < ROM::Struct
    transform_keys(&:to_sym)

    attribute :id, Types::Integer
    attribute :metadata do
      attribute :event_type, Types::String
    end
  end
end
