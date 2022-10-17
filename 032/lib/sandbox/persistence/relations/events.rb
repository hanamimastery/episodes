# frozen_string_literal: true

module Sandbox
  module Persistence
    module Relations
      class Events < ROM::Relation[:sql]
        schema(:events, infer: true)
      end
    end
  end
end
