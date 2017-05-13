class Encounter < ApplicationRecord
  has_many :characters
  has_many :messages
end
