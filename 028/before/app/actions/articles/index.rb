# frozen_string_literal: true

module Sandbox
  module Actions
    module Articles
      class Index < Action
        def handle(req, res)
          res.status = 200
          relation = []
          res.body = relation.to_a.to_json
        end
      end
    end
  end
end
