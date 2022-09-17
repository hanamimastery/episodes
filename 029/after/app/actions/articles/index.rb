# frozen_string_literal: true

module Sandbox
  module Actions
    module Articles
      class Index < Action
        include Deps['persistence.rom']

        def handle(_req, res)
          res.status = 200
          relation = rom.relations[:articles].combine(:author)
          res.body = serialize(relation)
        end

        private

        def serialize(collection)
          collection.to_a.to_json
        end
      end
    end
  end
end
