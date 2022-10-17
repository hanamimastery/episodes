# frozen_string_literal: true

module Sandbox
  module Entities
    class Author < Entity
      def full_name
        first_name << " " << last_name
      end
    end
  end
end
