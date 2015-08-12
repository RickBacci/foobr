class SessionsController < ApplicationController
  if Rails.env != 'development'
    force_ssl only: [:create]
  def create
    if role
      user = User.from_omniauth(env["omniauth.auth"], role)
      session[:user_id] = user.id
    else
      user = User.from_omniauth(env["omniauth.auth"])
      session[:user_id] = user.id
    end

    if current_user
      flash[:notice] = "Welcome #{current_user.name}"
      redirect_to root_path
    else
      flash[:error] = "There was a problem with your login"
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have successfully logged out."
    redirect_to root_path
  end

  private

  def role
    request.env['omniauth.params']['role']
  end
end
