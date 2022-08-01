# frozen_string_literal: true

module Sandbox
  module Interactors
    class GenerateSitemap
      include Deps[
        'sitemap.generator',
        'sitemap.route_inspector',
        messages_repo: 'repositories.messages'
      ]

      def call
        csv = CSV.new(route_inspector.call, headers: true)
        messages = messages_repo.all

        generator.create do
          csv.read.each do |row|
            next if row[0] != 'GET' || row[1].include?(':')

            add row[1], changefreq: 'daily', priority: 0.9
          end

          messages.each do |message|
            add "/messages/#{message.id}", changefreq: 'daily', priority: 0.9
          end
        end

        generator.ping_search_engines
      end
    end
  end
end
