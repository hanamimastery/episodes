# frozen_string_literal: true

module Sandbox
  module Actions
    module Sitemap
      class Show < Action
        before :set_headers

        def handle(req, res)
          res.body = File.read('public/sitemap.xml.gz')
        end

        private

        def set_headers(req, res)
          res.headers.merge!(
            'Content-Encoding' => 'gzip',
            'Content-Type' => 'application/xml'
          )
        end
      end
    end
  end
end
