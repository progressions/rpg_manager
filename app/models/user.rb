# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  name            :string
#

class User < ApplicationRecord
  has_secure_password

  has_many :narrated_encounters, class_name: "Encounter"
  has_many :messages

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :party_memberships
  has_many :encounters, through: :party_memberships
end
