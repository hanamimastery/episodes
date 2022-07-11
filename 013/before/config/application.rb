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
    config.actions.content_security_policy[:default_src] = 'http://localhost:8080'
    config.actions.content_security_policy[:default_src] = 'http://localhost:8080 https://loremflickr.com'
  end
end
