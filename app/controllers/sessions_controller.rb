class SessionsController < ApplicationController
  def create
    role = request.env['omniauth.params']['role']
    user = User.from_omniauth(env["omniauth.auth"], role)
    session[:user_id] = user.id
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
