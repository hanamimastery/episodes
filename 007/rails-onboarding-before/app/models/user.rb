# frozen_string_literal: true

class User < ApplicationRecord
  validates :email, uniqueness: true
  validates :name, :email, presence: { message: 'must be filled' }

  # after_create :send_notification email
end
