class Message < ApplicationRecord
  belongs_to :encounter

  after_create_commit { MessageBroadcastJob.perform_later self }

  scope :chat, -> { where(message_type: "chat") }
  scope :system, -> { where(message_type: "system") }
end
