class MessagesController < ApplicationController
  def create
    @conversation = Conversation.includes(:recipient).find(params[:conversation_id])
    @message = @conversation.messages.create(message_params)
    @sender = User.find(@message.user_id)
    redirect_to new_conversation_path(check(@conversation))
  end

  def check(conversation)
    if conversation.sender_id == current_user.id 
      conversation.recipient_id
    else
      conversation.sender_id
    end
  end

  def view
    @conversation = Conversation.includes(:recipient).find(params[:conversation_id])
    @message = Message.find(params[:id])
    if @message.update_attributes(read_at: DateTime.now.to_date)
      # redirect_to view_message_path(@conversation.id, @message.id)
    end
  end

  private

  def message_params
    params.require(:message).permit(:user_id, :body)
  end
end

