# frozen_string_literal: true

require 'dry/cli'

module Hanamimastery
  module CLI
    require_relative 'cli/version'
    require_relative 'cli/error'
    require_relative 'cli/deps'
    require_relative 'cli/commands'

    extend Dry::CLI::Registry

    register 'touch', Commands::Touch
    register 'unshot', Commands::Unshot
    register 'pro', Commands::ToPRO
  end
end
