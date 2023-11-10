# frozen_string_literal: true

module Sandbox
  module Actions
    module Messages
      class Index < Action
        include Deps['repositories.messages']

        def handle(req, res)
          res.body = <<~HTML
            <html><body><ul>
            #{messages.all.map { |message| '<li>' + message.body + '</li>'}.join }
            </ul></body></html>
          HTML
        end
      end
    end
  end
end
