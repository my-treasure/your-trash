class MessagesController < ApplicationController


  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    @message.read = false

    @message.save
    ChatroomChannel.broadcast_to(
      @chatroom,
      render_to_string(partial: "message", locals: { message: @message })
    )
    head :ok

    count = unread_messages()
    UnreadMessagesChannel.broadcast_to("unread_messages_channel", count: count)
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
