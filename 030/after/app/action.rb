# auto_register: false
# frozen_string_literal: true

require "hanami/action"

module Sandbox
  class Action < Hanami::Action
    before :set_headers

    private

    def set_headers(_req, res)
      res.headers['Content-Type'] = 'application/json'
    end
  end
end
