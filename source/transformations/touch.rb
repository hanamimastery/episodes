#!/usr/bin/env ruby
# frozen_string_literal: true

module HanamiMastery
  module Transformations
    class Touch
      PATTERN = /^modifiedAt\:[[:space:]]"\d{4}-\d{2}-\d{2}"$/

      # Updates the modifiedAt with the passed date
      #
      def call(content, timestamp: nil)
        timestamp ||= Time.now
        content.gsub(
          PATTERN,
          %(modifiedAt: "#{timestamp.strftime("%Y-%M-%d")}")
        )
      end
    end
  end
end
