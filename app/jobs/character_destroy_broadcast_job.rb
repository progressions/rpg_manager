class CharacterDestroyBroadcastJob < ApplicationJob
  queue_as :default

  def perform(data)
    ActionCable.server.broadcast "encounter_#{data[:encounter_id]}_characters", action: "destroy", id: data[:id], data: ""

    message = "#{data[:name]} has been removed from the encounter"
    Message.create! message_type: "system", encounter_id: data[:encounter_id], body: message
  end
end
