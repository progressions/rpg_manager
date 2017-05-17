class Encounter < ApplicationRecord
  has_many :characters
  has_many :messages

  belongs_to :user
end
