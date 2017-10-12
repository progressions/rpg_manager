# == Schema Information
#
# Table name: party_memberships
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  encounter_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class PartyMembership < ApplicationRecord
  belongs_to :player, class_name: "User", foreign_key: "user_id"
  belongs_to :encounter
end
