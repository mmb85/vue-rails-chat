require 'pry'

module Api
  module V1
    class UsersController < ApplicationController
      def create
        user = User.find_or_initialize_by(user_params)

        if user.save
          render :json => { user: user.name }
        else
          render :json => { errors: user.errors.messages }, status: 500
        end
      end

      private

        def user_params
          params.require(:user).permit(:name)
        end
    end
  end
end