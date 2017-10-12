# == Schema Information
#
# Table name: messages
#
#  id           :integer          not null, primary key
#  body         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  encounter_id :integer
#  message_type :string
#  user_id      :integer
#

class Message < ApplicationRecord
  belongs_to :encounter
  belongs_to :user, optional: true

  after_create_commit { MessageBroadcastJob.perform_later self }

  scope :chat, -> { where(message_type: "chat") }
  scope :system, -> { where(message_type: "system") }

  def from_narrator?
    self.encounter.narrator == self.user
  end
end
