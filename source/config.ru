# frozen_string_literal: true

require 'rack/static'
use Rack::Static,
    urls: ['/assets'],
    root: '.assets/tmp',
    header_rules: [
      [
        '/assets',
        { 'Cache-Control' => 'public, max-age=31536000' }
      ]
    ]

require 'rack/method_override'
use Rack::MethodOverride

require_relative './lib/rack/locale'
use Rack::Locale

require_relative './lib/rack/with_time'
use Rack::WithTime

require 'hanami/boot'
run Hanami.app
