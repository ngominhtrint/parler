class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: true
  validates :name, presence: true

  has_many :conversations
  has_many :messages
end
