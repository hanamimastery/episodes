# frozen_string_literal: true

require "hanami"

module Hanamimastery
  # Handles HTTP requests.
  class App < Hanami::App
    config.actions.content_security_policy[:script_src] = "https://unpkg.com"

    config.shared_app_component_keys += ["mailers.contact_mailer"]
  end
end
