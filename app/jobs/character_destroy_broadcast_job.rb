class CharacterDestroyBroadcastJob < ApplicationJob
  queue_as :default

  def perform(data)
    ActionCable.server.broadcast "encounter_#{data[:encounter_id]}_characters", action: "destroy", id: data[:id], data: ""
  end
end
