module Main
  module Mailers
    class ContactMailer < Hanami::Mailer
      from -> locals { locals.dig(:contact, :email) }
      to "support@hanamimastery.com"

      subject "Request: Subscription does not work"
      template 'contact_mailer'

      include Deps['mailer.configuration']
    end
  end
end
