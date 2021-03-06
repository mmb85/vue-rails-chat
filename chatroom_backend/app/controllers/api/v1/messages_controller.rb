module Api
  module V1
    class MessagesController < ApplicationController
      def create
        begin
          text = params[:text]
          room = Room.find_by(name: params[:room])
          user = User.find_by(name: params[:user])

          Message.create!(text: text, room: room, user: user) if text && room && user

          render :json => {message: "Message created:\n #{room.name} || #{user.name}\n#{text}"}
        rescue => e
          render :json => {error: e.message}, status: 500
        end
      end

      def index
        room = Room.find_by(name: params[:room])
        messages = Message.where(room: room)

        json = []
        messages.each do  |message|
          json << "#{message.user.name}: #{message.text}\n"
        end
        render :json => json
      end
    end
  end
end