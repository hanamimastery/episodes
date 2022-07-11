# frozen_string_literal: true

require 'dry/effects'

module Main
  module Views
    module Home
      class Show < View::Base
        include Dry::Effects::Reader(:locale)
        include Dry::Effects.CurrentTime

        expose :message do
          formatted_time = current_time.strftime('%Y-%m-%d %H:%M:%S')
          case locale
          when 'en' then "Welcome to Hanami Mastery #{formatted_time}!"
          when 'sw' then "Karibu Hanami Mastery #{formatted_time}!"
          else "We can't translate but welcome you anyway #{formatted_time}!"
          end
        end
      end
    end
  end
end
