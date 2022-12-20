# frozen_string_literal: true

module Main
  module Actions
    module Books
      class Index < Main::Action
        def handle(*, response)
          response.body = self.class.name
        end
      end
    end
  end
end
