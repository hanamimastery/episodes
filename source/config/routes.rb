# frozen_string_literal: true

module Hanamimastery
  class Routes < Hanami::Routes
    # Add your routes here. See https://guides.hanamirb.org/routing/overview/ for details.

    slice :main, at: "/"
  end
end
