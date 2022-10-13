# frozen_string_literal: true

require 'dry/types'

module Sandbox
  module Actions
    class Patch < Action

      after :handle_result

      def handle_result(_req, res)
        result = res[:result]
        if result.succes?
          res.status = 202
          res.body = 'success'
        else
          res.status = result.failure[:status]
          res.body = result.failure.errors
        end
      end
    end
  end
end
