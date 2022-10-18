# frozen_string_literal: true

module Sandbox
  module Events
    class AuthorRegistered < Event
      attribute :author_id, Types::Integer
      attribute :first_name, Types::String
      attribute :last_name, Types::String
      attribute :nickname, Types::String
    end
  end
end
