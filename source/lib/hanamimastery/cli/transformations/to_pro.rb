# frozen_string_literal: true

require 'commonmarker'

module Hanamimastery
  module CLI
    module Transformations
      class ToPRO
        HOST = 'https://hanamimastery.com'

        def call(content)
          result = content.gsub(/:::(.*?):::/m, '')
          result = Commonmarker.to_html(result)
          result
            .gsub('src="/images', %{src="#{HOST}/images})
            .gsub(/<\/h\d>/, "</h1>")
            .gsub(/<h\d>/, "<h1>")
        end
      end
    end
  end
end
