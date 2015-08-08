class SpecialtiesController < ApplicationController

  def index
    @specialties = Specialty.all
  end

  def new
    @specialty = current_user.specialties.new
  end

  def create
    @specialty = current_user.specialties.create(specialty_params)
    if @specialty
      redirect_to specialties_path
    else
      render :back
    end
  end

  private

    def specialty_params
      params.require(:specialty).permit([:specialty_name])
    end
end
