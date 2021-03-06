class CharacterCreateBroadcastJob < ApplicationJob
  queue_as :default

  def perform(data)
    character = Character.find(data['id'])
    if character.active
      ActionCable.server.broadcast "encounter_#{character.encounter_id}_characters", action: "create", id: character.id, data: render_character(character)
    end

    message = "#{character.name} joined the encounter"
    Message.create! user_id: data['user_id'], message_type: 'system', encounter_id: character.encounter_id, body: message
  end

  private

    def render_character(character)
      ApplicationController.renderer.render(partial: 'characters/character', locals: {character: character})
    end
end
