require 'securerandom'
module Api
  class UsersController < ApplicationController
    def show
      user = User.find(session[:user]["id"])
      render json: user
    end

    def create
      @user = User.where(google_id: (params[:google_id])).first
      if @user.nil?
        @user = User.new(user_params)
        @user[:name] = SecureRandom.alphanumeric(10)
        if @user.save!
          # ここでエラーはくとinsertされない
          session_save
          render json: @user
        else
          render json: @user.errors
        end
      else
        session_save
        render json: @user
      end
    end

    private
      def user_params
        params.require(:user).permit(:google_id)
      end

      def session_save
        session[:user] = @user
        session[:user][:id] = @user[:id]
      end
  end
end