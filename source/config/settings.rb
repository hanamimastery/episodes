# frozen_string_literal: true

require "interlinker/types"
require "hanami/application/settings"

module Interlinker
  class Settings < Hanami::Application::Settings
    # Database
    setting :database_url, constructor: Types::String

    # Application
    setting :session_secret, constructor: Types::String

    # Assets
    setting :precompiled_assets, constructor: Types::Params::Bool, default: false
  end
end
