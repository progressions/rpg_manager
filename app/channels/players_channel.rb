class PlayersChannel < ApplicationCable::Channel
  def subscribed
    stream_from "encounter_#{params[:encounter_id]}_players"
  end

  def unsubscribed
  end

  def change(data)
    ActionCable.server.broadcast 'players_channel', data
  end
end
