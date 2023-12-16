# frozen_string_literal: true

require "hanami"

module Hanamimastery
  class App < Hanami::App
    config.actions.sessions = :cookie, {
      key: 'hanamimaster.session',
      secret: settings.session_secret,
      expire_after: 60*60*24*365
    }

    config.actions.content_security_policy[:script_src] = [
      'self',
      'https://kit.fontawesome.com',
      'localhost:2300'
    ].join(' ')

    config.actions.content_security_policy[:connect_src] = [
      'self',
      'https://ka-f.fontawesome.com'
    ].join(' ')

    config.actions.content_security_policy[:font_src] = [
      'self',
      'https://ka-f.fontawesome.com'
    ].join(' ')
  end
end
