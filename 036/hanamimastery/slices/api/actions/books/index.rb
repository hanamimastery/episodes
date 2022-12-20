# frozen_string_literal: true

module API
  module Actions
    module Books
      class Index < API::Action
        def handle(*, response)
          response.body = self.class.name
        end
      end
    end
  end
end
