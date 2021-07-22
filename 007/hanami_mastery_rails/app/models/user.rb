class User < ApplicationRecord
  validates :email, uniq: true
  validates :name, :email, presence: true
end
