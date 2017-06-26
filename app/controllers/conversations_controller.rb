class ConversationsController < ApplicationController

  def new
    @conversation = Conversation.get(current_user.id, params[:id])
  end

  def create
  end
end