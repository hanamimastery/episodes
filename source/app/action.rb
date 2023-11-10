# auto_register: false
# frozen_string_literal: true

require "hanami/action"

module Sandbox
  class Action < Hanami::Action
    before :validate_params

    private

    def validate_params(req, res)
      halt 400, req.params.errors.to_h unless req.params.valid?
    end
  end
end
