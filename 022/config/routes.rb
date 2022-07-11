# frozen_string_literal: true

require 'hanami/application/routes'

module Sandbox
  class Routes < Hanami::Application::Routes
    define do
      slice :main, at: '/' do
        root to: 'home.show'

        get '/subscriptions',
            as: :subscriptions,
            to: ->(_env) { [200, {}, [['Awesome Subscriber 1']]] }

        get '/subscriptions/:id',
            as: :subscription,
            to: ->(_env) { [200, {}, ['Awesome Subscriber 1']] }

        post '/subscribe',
             as: :subscribe,
             to: ->(_env) { [201, {}, ['Thank You!!!']] }

        redirect '/home', to: '/'
      end
    end
  end
end
