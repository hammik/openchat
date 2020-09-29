class GroupChannel < ApplicationCable::Channel
  def subscribed
    stream_from "group_channel_#{current_user.id}"
    #stream_from "group_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Message.create!({content: data["message"], group_id: data["group_id"], user_id: data["user_id"]})
    #ActionCable.server.broadcast  "group_channel", message: render_message(message)
    #GroupChannel.broadcast_to(group, message: render_message(message))
  end
end
