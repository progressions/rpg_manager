class MessageChannel < ApplicationCable::Channel
  def subscribed
    stream_from "encounter_#{params[:encounter_id]}_messages"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Message.create! user_id: data["user_id"], message_type: "chat", encounter_id: data["encounter_id"], body: data["body"]
  end
end
