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

  after_create_commit :join_message
  after_destroy_commit :leave_message

  def join_message
    message = "Player #{player.name} is now playing this encounter"
    Message.create! user_id: self.user_id, message_type: 'system', encounter_id: self.encounter_id, body: message

    PlayersUpdateBroadcastJob.perform_later id: self.encounter_id
  end

  def leave_message
    message = "Player #{player.name} has left this encounter"
    Message.create! user_id: self.user_id, message_type: 'system', encounter_id: self.encounter_id, body: message

    PlayersUpdateBroadcastJob.perform_later id: self.encounter_id
  end
end
