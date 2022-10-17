# frozen_string_literal: true

module Sandbox
  module Actions
    class Post < Action
      before :deserialize
      before :authorize
      before :validate
      after :handle_result

      ERRORS = {
        400 => API::Errors::UnprocessableEntity
      }

      include Deps[
        deserializer: 'deserializers.json_api'
      ]

      # include JayDoubleuTee::Auth

      def handle(req, res)
        res[:result] = interactor.call
      end

      private

      def deserialize(req, res)
        result = deserializer.call(req.params.to_h)
        return res[:result] = result.value! if result.success?

        fail(400, result.failure)
      end

      def authorize(req, _res)
        pp __method__
        # result = authorizer.call(model: req.params, auth: auth)
        # return if result.success?

        # fail(403, result.failure)
      end

      def validate(req, res)
        result = contract.call(res[:result])
        return res[:result] = result.value! if result.success?

        fail(422, result.failure)
      end

      def fail(http_status, failure)
        error = ERRORS[http_status].new(details: failure)
        halt error.status, error.to_json
      end

      def handle_result(_req, res)
        if res[:result].success?
          res.status = 201
        else
          fail(403, res[:result].failure)
        end
      end
    end
  end
end
