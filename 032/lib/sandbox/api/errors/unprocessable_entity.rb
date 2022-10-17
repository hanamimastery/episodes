# frozen_string_literal: true

module Sandbox
  module API
    module Errors
      class UnprocessableEntity
        def initialize(details:)
          @details = details
        end

        attr_reader :details

        def status = 400

        def to_json
          {
            errors: details.to_h.map do |k, v|
              {
                status: "400",
                source: { pointer: k },
                title: "Incorrect format",
                detail: v
              }
            end
          }.to_json
        end
      end
    end
  end
end
