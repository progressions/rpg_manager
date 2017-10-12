# == Schema Information
#
# Table name: encounters
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  private    :boolean
#

class Encounter < ApplicationRecord
  has_many :characters
  has_many :messages

  belongs_to :narrator, class_name: "User", foreign_key: "user_id"

  has_many :party_memberships
  has_many :players, class_name: "User", foreign_key: "user_id", through: :party_memberships

  scope :no_players, -> { left_joins(:party_memberships).where(party_memberships: { id: nil }) }
  scope :without_player, -> (user) { left_joins(:party_memberships).where.not(party_memberships: { user_id: user }) }

  # Find encounters which aren't owned by or played by this user
  scope :available, -> (user) { where.not(encounters: { user_id: user }) }
  scope :private_encounters, -> { where(private: true) }
  scope :public_encounters, -> { where("private IS NOT ?", true) }
end
