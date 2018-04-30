module Api
  module V1
    class MessagesController < ApplicationController
      #POST
      def create
        Message.create!(text: 'sadfsdfgdgf', room: Room.first, user: User.first)

        render :json => {}
      end

      def index
        render :json => Message.all.pluck(:text)
      end
    end
  end
end