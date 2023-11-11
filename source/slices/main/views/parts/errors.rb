# frozen_string_literal: true

module Main
  module Views
    module Parts
      class Errors < Part
        def message(key)
          msgs = value[key] || []
          msgs.join(", ")
        end
      end
    end
  end
end
