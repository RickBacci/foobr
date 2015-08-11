class UserSpecialtiesController < ApplicationController

  def destroy
    user_specialty = UserSpecialty.find_by(specialty_id: params[:specialty_id])
    user_specialty.destroy

    redirect_to current_user
  end
end
