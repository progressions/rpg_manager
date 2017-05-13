class Message < ApplicationRecord
  belongs_to :encounter

  after_create_commit { MessageBroadcastJob.perform_later self }
end
