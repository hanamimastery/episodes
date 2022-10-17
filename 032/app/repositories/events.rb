# frozen_string_literal: true

module Sandbox
  module Repositories
    class Events < Repository[:events]
      def events
        super.map_with(:event_mapper)
      end
    end
  end
end
