# frozen_string_literal: true

require 'sandbox/types'
require 'hanami/application/settings'

module Sandbox
  class Settings < Hanami::Application::Settings
    # Framework
    setting :log_to_stdout, constructor: Types::Params::Bool, default: false

    # Database
    setting :database_url, constructor: Types::String

    # Application
    setting :session_secret, constructor: Types::String

    # Assets
    setting :precompiled_assets, constructor: Types::Params::Bool, default: false

    # JWT
    setting :jwt_public_key, constructor: Types::String
  end
end
