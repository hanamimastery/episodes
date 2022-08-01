# frozen_string_literal: true

module Sandbox
  module Repositories
    class Messages
      class Message
        def initialize(id:, body:)
          @id = id
          @body = body
        end

        attr_reader :id, :body
      end

      STORE = {
        1 => "Subscribe to the channel, it really matters  :>)",
        2 => "You can also hit a like, that helps too!",
        3 => "And if not, no worries, I like you neverless!"
      }

      def find(id)
        message(id, STORE[id]) if STORE[id]
      end

      def all
        STORE.map { |id, body| message(id, body) }
      end

      private

      def message(id, body)
        Message.new(id: id, body: body)
      end
    end
  end
end
