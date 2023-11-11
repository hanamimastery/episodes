# frozen_string_literal: true

module Main
  module Actions
    module Contact
      class Send < Main::Action
        before :deserialize, :validate

        include Deps[
          'mailers.contact_mailer',
          failure_view: 'views.contact.show'
        ]

        params do
          required(:contact).schema do
            required(:email).filled(:str?)
            required(:message).filled(:str?)
          end
        end

        def handle(request, response)
          # contact_mailer.deliver(contact: response[:contact])
          pp response[:contact]
          response.redirect routes.path(:contact)
        end

        private

        def validate(request, response)
          return if request.params.valid?

          errors = request.params.errors

          body = response.render(
            failure_view,
            contact: response[:contact],
            errors: errors[:contact]
          )
          halt 422, body
        end

        def deserialize(request, response)
          response[:contact] = request.params[:contact]
        end
      end
    end
  end
end
