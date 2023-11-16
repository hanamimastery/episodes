# frozen_string_literal: true

require "hanami"

module Hanamimastery
  class App < Hanami::App
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
