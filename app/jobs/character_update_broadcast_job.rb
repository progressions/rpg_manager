class CharacterUpdateBroadcastJob < ApplicationJob
  queue_as :default

  def perform(data)
    character = Character.find(data['id'])
    ActionCable.server.broadcast "characters_channel", action: 'change', id: character.id, data: render_character(character)
  end

  private

    def render_character(character)
      ApplicationController.renderer.render(partial: 'characters/character', locals: {character: character})
    end
end
