# frozen_string_literal: true

Hanami.app.register_provider :sitemap, namespace: true do |container|
  prepare do
    require 'sitemap_generator'
    require 'hanami/router/inspector'
    require 'hanami/router/formatter/csv'

    SitemapGenerator::Sitemap.default_host =
      container['settings'].default_host

    formatter = Hanami::Router::Formatter::CSV.new
    route_inspector = Hanami::Router::Inspector.new(formatter: formatter)
    Sandbox::App.router(inspector: route_inspector)

    register 'route_inspector', route_inspector
    register 'generator', SitemapGenerator::Sitemap
  end
end
