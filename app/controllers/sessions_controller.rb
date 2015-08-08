class SessionsController < ApplicationController
  def create
    if role_set?
      role = request.env['omniauth.params']['role']
      user = User.from_omniauth(env["omniauth.auth"], role)
      session[:user_id] = user.id
    else
      raise "Role not set!"
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

  def role_set?
    request.env['omniauth.params']['role']
  end
end
