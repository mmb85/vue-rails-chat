class MessagesChannel < ApplicationCable::Channel
  def subscribed
    binding.pry
    stream_from "room-#{params[:room].parameterize}"
  end

  def receive(data)
    binding.pry
    ActionCable.server.broadcast("room-#{params[:room].parameterize}", data)
  end
end
