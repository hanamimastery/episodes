# frozen_string_literal: true

module Hanamimastery
  class Routes < Hanami::Routes
    root { "Hello from Hanami" }

    slice :api, at: "/api" do
    end

    slice :admin, at: "/admin" do
    end

    slice :main, at: "/" do
    end
  end
end
