# frozen_string_literal: true

module Sandbox
  module Calculators
    class Divider
      def call(a, b)
        b.zero? ? "Can't divide by 0" : a / b
      end
    end
  end
end
