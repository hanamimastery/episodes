# frozen_string_literal: true

require "sandbox/types"
require "hanami/settings"

module Sandbox
  class Settings < Hanami::Settings
    setting :default_host, constructor: Types::String
  end
end
