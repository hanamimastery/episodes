# frozen_string_literal: true

module Sandbox
  module Persistence
    module Relations
      class Articles < ROM::Relation[:sql]
        schema(:articles, infer: true) do
          associations do
            belongs_to :author
          end
        end
      end
    end
  end
end
