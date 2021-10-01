# frozen_string_literal: true

require 'faker'
module Main
  module Entities
    class Author
      attr_reader :first_name, :last_name

      def initialize(args = {})
        @first_name = Faker::Name.first_name
        @last_name = Faker::Name.last_name
      end
    end
  end
end
