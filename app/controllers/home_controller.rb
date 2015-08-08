class HomeController < ApplicationController
  def show
    #@user = User.find(session[:user_id]) if current_user
    @user = User.find(session[:user_id]) if current_user
    @developers = User.where(role: 'developer') if current_user
  end
end
