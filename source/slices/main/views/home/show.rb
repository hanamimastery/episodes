# frozen_string_literal: true

module Main
  module Views
    module Home
      class Show < View::Base
        expose :message do
          "Welcome to Hanami Mastery"
        end
      end
    end
  end
end
