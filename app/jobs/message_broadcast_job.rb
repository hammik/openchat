class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
  end

  def perform(message)
    #GroupChannel.broadcast_to(group,message: render_message(message))
    ActionCable.server.broadcast  "group_channel_#{message.group_id}", message: render_message(message)
    #ActionCable.server.broadcast  group, message: render_message(message)
    #ActionCable.server.broadcast  "group_channel", message: render_message(message)
    
  end

  private
  def render_message(message)
    ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message})
  end

end
