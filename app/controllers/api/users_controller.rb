module Api
  class UsersController < ApplicationController
    def create
      @user = User.where(google_id: (params[:google_id]))
      if @user == nil 
        @user = User.new(user_params)
        if @user.save!
          render json: @user
          # ここでエラーはくとinsertされない
          session_save
        else
          render json: @user.errors
        end
      else 
        session_save
      end
    end

    private
      def user_params
        params.require(:user).permit(:google_id)
      end
      
      def session_save
        session[:user] = @user
        puts session[:user]
      end
  end
end