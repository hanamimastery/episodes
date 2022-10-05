# frozen_string_literal: true
require 'byebug'

module Sandbox
  module Actions
    class Get < Action
      after :success

      private

      def serialize(model)
        collections = [
          Array, ROM::Relation::Combined, Sandbox::Persistence::Relations
        ]
        is_collection = collections & model.class.ancestors

        if is_collection
          model.map(&:to_h)
        else
          model.to_h
        end.to_json
      end

      def success(req, res)
        res.status = 200
      end
    end
  end
end
