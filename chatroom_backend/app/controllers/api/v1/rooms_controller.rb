module Api
  module V1
    class RoomsController < ApplicationController
      #GET
      def index
        @rooms = Room.order('created_at DESC')

        render :json => @rooms.as_json
      end

      def show
        index
      end

      def create
        room = Room.new(room_params)

        if room.save
          render :json => { room: room.name }
        else
          render :json => { errors: room.errors.messages }, status: 500
        end
      end


      def destroy
        Room.where(name: params[:name]).delete if params[:name]

        render :json => {}
      end

      def delete
        destroy
      end

      # def lastest_20_message
      #   room = Room.find_by(name: params[:name])
      #   messages = room.messages.order_by(:created_at => 'desc').limit(20).pluck(:text)
      #
      #   render :json => messages.as_json
      # end
      private

        def room_params
          params.require(:room).permit(:name)
        end
    end
  end
end