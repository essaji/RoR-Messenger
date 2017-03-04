class ConversationsController < ApplicationController
  def showlist

    @my_conversations = Conversation.where('sender_id = ? OR recipient_id = ?',current_user.id, current_user.id)
  end

  def new
    @user_id = params[:user_id] || request.query_parameters['user_id']
    @my_id = current_user.id
    @conversation = Conversation.where(:recipient_id => @user_id).where(:sender_id => @my_id).first || Conversation.where(:recipient_id => @my_id).where(:sender_id => @user_id).first


    if !@conversation.present?
      @conversation = Conversation.new
      @conversation.sender = current_user
      @conversation.recipient = User.find(@user_id)
      @conversation.save
    end

    @messages = Message.where(:conversations_id => @conversation.id)

  end

  def post
    message = Message.new
    message.body = params[:message_body] rescue nil
    message.body = "#{current_user.email}: #{message.body}"
    message.user_id = request.query_parameters['user_id']
    message.conversations_id =request.query_parameters['conversation_id']
    message.save
    redirect_to conversations_new_path(user_id: message.user_id)
  end
end