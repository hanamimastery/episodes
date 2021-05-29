# frozen_string_literal: true

require 'rack/static'
use Rack::Static,
    urls: ['/assets'],
    root: 'public',
    header_rules: [
      ['/assets', { 'Cache-Control' => 'public, max-age=31536000' }]
    ]

require 'rack/method_override'
use Rack::MethodOverride

require 'hanami/boot'
run Hanami.app