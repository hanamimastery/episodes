# frozen_string_literal: true

require 'sidekiq'

module Sandbox
  module Workers
    class GenerateSitemap
      include Sidekiq::Job

      include Deps['interactors.generate_sitemap']

      def perform
        generate_sitemap.call
      end
    end
  end
end
