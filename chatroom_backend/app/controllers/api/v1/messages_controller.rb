module Api
  module V1
    class MessagesController < ApplicationController
      def create
        begin
          text = params[:text]
          room = Room.find_by(name: params[:room])
          user = User.find_by(name: params[:user])

          message = Message.create!(text: text, room: room, user: user) if text && room && user

          render :json => {message: "Message created:\n #{room.name} || #{user.name}\n#{text}"}
        rescue => e
          render :json => {error: e.message}, status: 500
        end
      end

      def index
        render :json => Message.all.pluck(:text)
      end
    end
  end
end