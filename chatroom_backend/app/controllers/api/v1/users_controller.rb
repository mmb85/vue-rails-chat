require 'pry'

module Api
  module V1
    class UsersController < ApplicationController
      #GET
      def index
        @users = User.order('created_at DESC')

        render :json => @users.as_json( :only => [:name] )
      end

      #POST
      def create
        User.create(name: params[:name]) if params[:name]

        render :json => {}
      end

      def new

      end

      def delete

      end

      def suscribe

      end
    end
  end
end