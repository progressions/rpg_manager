class CharactersChannel < ApplicationCable::Channel
  def subscribed
    stream_from "characters_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def change(data)
    # ActionCable.server.broadcast 'characters_channel', data
    ActionCable.server.broadcast 'characters_channel', {"action" => "create"}
  end

  def create(data)
    ActionCable.server.broadcast 'characters_channel', {"action" => "create"}
  end
end
