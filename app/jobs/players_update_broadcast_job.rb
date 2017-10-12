class PlayersUpdateBroadcastJob < ApplicationJob
  queue_as :default

  def perform(data)
    encounter = Encounter.find(data[:id])
    ActionCable.server.broadcast "encounter_#{encounter.id}_players", action: "change", id: encounter.id, data: render_players(encounter)
  end

  private

    def render_players(encounter)
      ApplicationController.renderer.render partial: "characters/players", locals: { encounter: encounter }
    end
end
