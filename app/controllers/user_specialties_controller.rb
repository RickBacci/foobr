class UserSpecialtiesController < ApplicationController

  def destroy
    #have specialty id need to delete user_specialties that have that id
    #as specialty_id

    user_specialty = UserSpecialty.find_by(specialty_id: params[:id])
    user_specialty.destroy
    # current_user.user_specialties.find_by(specialty_id: params[:id]).destroy]

    redirect_to current_user
  end
end
