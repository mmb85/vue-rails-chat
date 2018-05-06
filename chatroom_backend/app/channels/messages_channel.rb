class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room-#{params[:room].parameterize}"
  end

  def receive(data)
    ActionCable.server.broadcast("room-#{params[:room].parameterize}", data)
  end
end
