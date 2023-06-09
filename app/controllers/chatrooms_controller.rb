class ChatroomsController < ApplicationController
  def index
    # list chatrooms messages belonging to user
    @chatrooms = Chatroom.where(booker_id: current_user.id).or(Chatroom.where(offerer_id: current_user.id)).order(created_at: :desc)
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new

    # find messages belonging to the chatroom
    @messages = Message.where(chatroom_id: @chatroom.id)
    @unread_messages = @messages.where(read: false)
    # if messages doesn't belong to current user, mark as read
    @unread_messages.where.not(user: current_user).each do |message|
      message.update(read: true)
    end
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    @chatroom.save
    redirect_to chatroom_path(@chatroom)
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:name, :booking_id)
  end
end
