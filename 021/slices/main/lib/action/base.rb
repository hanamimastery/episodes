# auto_register: false
# frozen_string_literal: true

require 'interlinker/action/base'

module Main
  module Action
    class Base < Interlinker::Action::Base
      before :set_headers

      private

      def set_headers(_req, res)
        res.headers['Content-Type'] = 'application/json'
      end
    end
  end
end
