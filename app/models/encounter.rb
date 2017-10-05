class Encounter < ApplicationRecord
  has_many :characters
  has_many :messages

  belongs_to :narrator, class_name: "User", foreign_key: "user_id"

  has_many :party_memberships
  has_many :players, class_name: "User", foreign_key: "user_id", through: :party_memberships

  scope :no_players, -> { left_joins(:party_memberships).where(party_memberships: { id: nil }) }
  scope :without_player, -> (user) { left_joins(:party_memberships).where.not(party_memberships: { user_id: user }) }

  # Find encounters which aren't owned by or played by this user
  scope :available, -> (user) { no_players.or(without_player(user)).where.not(encounters: { user_id: user }) }
end
