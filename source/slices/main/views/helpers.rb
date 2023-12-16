# auto_register: false
# frozen_string_literal: true

module Main
  module Views
    module Helpers
      # Add your view helpers here

      def flash_message
        flash = _context.flash
        notification_scope =
          scope(Scopes::Notification, notification: flash)

        return if notification_scope.hidden?

        notification_scope.render('layouts/flash_msg')
      end
    end
  end
end
