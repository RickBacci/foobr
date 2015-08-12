class UserSpecialtiesController < ApplicationController
  respond_to :json

  def index
    @user_specialties = current_user.specialties
    respond_with @user_specialties
  end

  def destroy
    user_specialty = UserSpecialty.find_by(specialty_id: params[:specialty_id])
    user_specialty.destroy

    head :ok
  end
end

