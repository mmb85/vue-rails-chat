require 'pry'

module Api
  module V1
    class UsersController < ApplicationController
      def index
        @users = User.order('created_at DESC')

        render :json => @users.as_json( :only => [:name] )
      end

      def show
        index
      end

      def create
        begin
          user = User.create!(name: params[:name]) if params[:name]
          render :json => {user: user.name}
        rescue => e
          render :json => {error: e.message}, status: 500
        end
      end

      def delete
      end

      def suscribe
      end
    end
  end
end