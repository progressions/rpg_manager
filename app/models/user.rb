class User < ApplicationRecord
  has_secure_password

  has_many :encounters
  has_many :messages

  validates :name, presence: true
  validates :email, presence: true
end
