class CharacterUpdateBroadcastJob < ApplicationJob
  queue_as :default

  def perform(data)
    character = Character.find(data['id'])
    ActionCable.server.broadcast "encounter_#{character.encounter_id}_characters", action: 'change', id: character.id, data: render_character(character)

    message = "#{character.name} now has #{character.health} health"
    Message.create! message_type: "system", encounter_id: character.encounter_id, body: message
  end

  private

    def render_character(character)
      ApplicationController.renderer.render(partial: 'characters/character', locals: {character: character})
    end
end
