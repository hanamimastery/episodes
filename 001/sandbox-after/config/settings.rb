# frozen_string_literal: true

require 'sandbox/types'

Hanami.application.settings do
  # Framework
  setting :log_to_stdout, Sandbox::Types::Params::Bool.optional.default(false)

  # Database
  setting :database_url, Sandbox::Types::String

  # Application
  setting :session_secret, Sandbox::Types::String

  # Assets
  setting :precompiled_assets, Sandbox::Types::Params::Bool.optional.default(false)
  setting :assets_server_url, Sandbox::Types::String.optional.default('http://localhost:8080')
end
