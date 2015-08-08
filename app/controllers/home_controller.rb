class HomeController < ApplicationController
  def show
    @user = User.find(session[:user_id]) if current_user
    @developers = User.where(role: 'developer')
  end
end
