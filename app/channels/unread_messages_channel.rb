class UnreadMessagesChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "unread_messages_channel"
  end

  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
