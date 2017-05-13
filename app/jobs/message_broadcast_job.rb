class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "encounter_#{message.encounter_id}_messages", data: render_message(message)
  end

  private

    def render_message(message)
      ApplicationController.renderer.render(partial: 'messages/message', locals: {message: message})
    end
end
