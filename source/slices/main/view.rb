# auto_register: false
# frozen_string_literal: true

module Main
  # The main view.
  class View < Hanamimastery::View
    config.paths = [Pathname(__dir__).join("templates").expand_path]
    # config.part_namespace = Main::Views::Parts
    # config.scope_namespace = Main::Views::Scopes
  end
end
