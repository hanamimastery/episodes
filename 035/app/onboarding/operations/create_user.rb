# frozen_string_literal: true

require 'dry-monads'

module Sandbox
  module Operations
    class CreateUser
      include Dry::Monads[:result, :try]

      def call(args)
        failure_message = 'too many subscriptions! Try again later'
        return fail!(failure_message) if User.count.positive?

        User.create!(args)
        # schedule_email(args)

        Success()
      end

      private

      def fail!(message)
        Failure[:teapot, message: message]
      end
    end
  end
end
