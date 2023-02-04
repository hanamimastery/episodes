# frozen_string_literal: true

module Hanamimastery
  module CLI
    module Transformations
      class Unshot
        PATTERN = /\[🎬[[:space:]]\d{1,3}\][[:space:]]/

        # removes shot marks [🎬 01] from the given string
        #
        def call(content, one: false)
          content.gsub(PATTERN, '')
        end
      end
    end
  end
end
