# frozen_string_literal: true

module Sandbox
  module Actions
    module Messages
      class Show < Action
        include Deps['repositories.messages']

        params do
          required(:id).filled(Types::Coercible::Integer)
        end

        def handle(req, res)
          message = messages.find(req.params[:id])
          halt 404, "Message not found" unless message

          res.body = message.body
        end
      end
    end
  end
end
