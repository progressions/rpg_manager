class Encounter < ApplicationRecord
  has_many :characters
  has_many :messages

  belongs_to :narrator, class_name: "User", foreign_key: "user_id"
end
