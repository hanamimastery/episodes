require 'dry/matcher/result_matcher'
require 'dry/monads'

module Onboarding
  module Endpoints
    class BaseAction
      def self.inherited(klass)
        super
        klass.class_eval do
          include Dry::Monads[:do, :result, :try]
          include Dry::Matcher.for(:call, with: Dry::Matcher::ResultMatcher)
        end
      end

      def call(request)
        Success()
      end
    end
  end
end
