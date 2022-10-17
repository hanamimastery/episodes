# frozen_string_literal: true

module Sandbox
  module Persistence
    module Relations
      class Authors < ROM::Relation[:sql]
        schema(:authors, infer: true) do
          associations do
            has_many :articles
          end
        end
      end
    end
  end
end
