class NotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "notifications:#{current_user.id}"
  end

  def unsubscribed
    stop_all_streams
  end

  def send_message(data)
   conversation = Conversation.find_by(id: data['conversation_id'])
   if conversation && conversation.participates?(current_user)
     message = current_user.messages.build({body: data['message']})
     message.conversation = conversation
     message.save!
   end
  end
end
