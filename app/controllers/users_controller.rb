class UsersController < ApplicationController

  def show
    @user = User.find(session[:user_id])
  end

  def edit
    @user = User.find(session[:user_id])
  end

  def update
    @user = User.find(session[:user_id])

    if @user.update(user_params)
      flash[:success] = "Account Updated!"
      redirect_to @user
    else
      flash[:errors] = "Invalid Attributes"
      redirect_to :back
    end
  end

  private

    def user_params
      params.require(:user).permit(
        :provider, :uid, :name, :email, :first_name,
        :last_name, :image, :oauth_token,
        :oauth_expires_at, :role, :company_name)
    end
end
