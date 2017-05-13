class MessageChannel < ApplicationCable::Channel
  def subscribed
    stream_from "messages_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Message.create! body: data["data"]
  end
end
