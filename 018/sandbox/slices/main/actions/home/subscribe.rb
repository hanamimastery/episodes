# frozen_string_literal: true

module Main
  module Actions
    module Home
      class Subscribe < Action::Base
        AuthorizationError = Class.new(StandardError)

        config.handle_exception AuthorizationError => :handle_authorize

        before :authorize

        params do
          required(:name).filled
        end

        def handle(req, res)
          res.status = 200
          res.headers.merge!('X-Custom' => 'OK')
          res.body = <<-HTML
            <p>#{res.body}</p>
            <h3>Hello, awesome suscriber!</h3>
            <p>#{req.params.to_h}</p>
          HTML
        end

        private

        def authorize(*)
          raise AuthorizationError
        end

        def handle_authorize(*, res, _req)
          res.status = 401
          res.body = 'Unauthorized'
        end
      end
    end
  end
end
