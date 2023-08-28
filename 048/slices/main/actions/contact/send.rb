# frozen_string_literal: true

module Main
  module Actions
    module Contact
      class Send < Main::Action
        include Deps[
          failure_view: 'views.contact.show',
          mailer: 'mailers.contact_mailer'
        ]

        before :deserialize, :validate

        params do
          required(:contact).schema do
            required(:email).filled(:string)
            required(:message).filled(:string)
          end
        end

        def handle(*, response)
          mailer.deliver(contact: response[:contact])
          response.redirect routes.path(:contact)
        end

        private

        def deserialize(request, response)
          response[:contact] = request.params[:contact]
        end

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
      end
    end
  end
end
