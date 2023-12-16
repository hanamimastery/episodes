# frozen_string_literal: true

module Hanamimastery
  class Settings < Hanami::Settings
    # Define your app settings here, for example:
    #
    # setting :my_flag, default: false, constructor: Types::Params::Bool
    setting :session_secret, constructor: Types::String
    setting :database_url, constructor: Types::String
    setting :font_awesome_kit, constructor: Types::String.optional
  end
end
