# frozen_string_literal: true

require "hanami"

module Hanamimastery
  class App < Hanami::App
    config.slices = ["api", "subscribing"]
  end
end
