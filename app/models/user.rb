class User < ApplicationRecord
  has_secure_password

  has_many :narrated_encounters, class_name: "Encounter"
  has_many :messages

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :party_memberships
  has_many :encounters, through: :party_memberships
end
