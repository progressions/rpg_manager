class CharacterDestroyBroadcastJob < ApplicationJob
  queue_as :default

  def perform(id)
    ActionCable.server.broadcast "characters_channel", action: "destroy", id: id, data: ""
  end
end
