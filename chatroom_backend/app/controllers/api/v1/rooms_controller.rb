module Api
  module V1
    class RoomsController < ApplicationController
      #GET
      def index
        @rooms = Room.order('created_at DESC')

        render :json => @rooms.as_json
      end

      #POST
      def create
        Room.create(name: params[:name]) if params[:name]

        render :json => {}
      end

      def new

      end

      def delete

      end
    end
  end
end