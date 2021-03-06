# frozen_string_literal: true

begin
  require 'break'
rescue LoadError => e
  raise unless e.path == 'break'
end

require 'hanami'

module Sandbox
  class Application < Hanami::Application
    config.sessions = :cookie, {
      key: 'sandbox.session',
      secret: settings.session_secret,
      expire_after: 60 * 60 * 24 * 365 # 1 year
    }

    config.logger.options[:level] = :debug
    config.logger.options[:stream] = settings.log_to_stdout ? $stdout : "log/#{Hanami.env}.log"

    config.actions.default_headers = {
      'X-Frame-Options' => 'DENY',
      'X-Content-Type-Options' => 'nosniff',
      'X-XSS-Protection' => '1; mode=block',
      'Access-Control-Allow-Origin' => 'http://localhost:8080',
      'Access-Control-Allow-Methods' => 'POST, GET, OPTIONS',
      'Content-Security-Policy' => \
        "base-uri 'self'; " \
        "child-src 'self'; " \
        "connect-src 'self'; " \
        "default-src 'none'; " \
        "font-src 'self' 'http://localhost:8080' data:; " \
        "form-action 'self'; " \
        "frame-ancestors 'self'; " \
        "frame-src 'self'; " \
        "img-src 'self' https: data: 'http://localhost:8080'; " \
        "media-src 'self'; " \
        "object-src 'none'; " \
        "script-src 'self' 'localhost' 'unsafe-eval' 'unsafe-inline' 'http://localhost:8080'; " \
        "style-src '*' 'unsafe-inline' 'http://localhost:8080';"
    }
  end
end
