class MessagesController < ApplicationController


  def creater
    message = Message.new(message_params)
    message.user = current_user
    if message.save
      ActionCable.server.broadcast 'messages',
        message: message.body,
        user: current_user.name,
        conversation_id: message.conversation_id,
        image: message.image
      head :ok
      NotificationRelayJob.perform_now(message)
    end
  end

  def show
    @message = Message.find(params[:id])
  end



  private
   def message_params
    params.require(:message).permit(:body, :user_id, :conversation_id, :image)
   end
end
