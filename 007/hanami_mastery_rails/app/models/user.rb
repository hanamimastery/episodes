class User < ApplicationRecord
  validates :email, :name, presence: true
  validates :email, unique: true

  after_create :send_confirmation_email

  def send_confirmation_email
    # ...
  end
end
