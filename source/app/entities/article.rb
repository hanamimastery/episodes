# frozen_string_literal: true

module Sandbox
  module Entities
    class Article < Entity
      include Dry::Effects.CurrentTime

      def published?
        published_on && (published_on <= current_time.to_date)
      end
    end
  end
end
