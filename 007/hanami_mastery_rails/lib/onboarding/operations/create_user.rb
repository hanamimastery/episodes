# frozen_string_literal: true

require 'dry-monads'

module Onboarding
  module Operations
    class CreateUser
      include Dry::Monads[:result, :try]

      def call(args)
        return fail!('too many subscriptions! Try again later') if User.count > 0

        user = User.create!(args)
        # schedule_email(user)
      end

      def fail!(message)
        Failure[:teapot, message: message]
      end
    end
  end
end
