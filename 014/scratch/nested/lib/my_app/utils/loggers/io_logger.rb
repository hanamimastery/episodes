# frozen_string_literal: true

module MyApp
  module Utils
    module Loggers
      class IOLogger
        def call(msg)
          puts msg
        end
      end
    end
  end
end
