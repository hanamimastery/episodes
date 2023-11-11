# frozen_string_literal: true

module Main
  module Mailers
    class ContactMailer < Hanami::Mailer
      include Deps['mailer.configuration']

      from ->(locals) { locals.dig(:contact, :email) }
      to Slice['settings'].mail_support

      subject 'Request: Subscription does not work'
      template 'contact_mailer'
    end
  end
end
