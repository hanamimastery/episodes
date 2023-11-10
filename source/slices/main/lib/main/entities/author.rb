# frozen_string_literal: true

module Main
  module Entities
    class Author
      attr_accessor :first_name, :last_name

      def initialize(args = {})
        self.first_name = args[:first_name] || Faker::Name.first_name
        self.last_name = args[:last_name] || Faker::Name.last_name
      end
    end
  end
end
