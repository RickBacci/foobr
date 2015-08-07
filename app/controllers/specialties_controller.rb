class SpecialtiesController < ApplicationController

  def index
    @specialties = Specialty.all
  end

  def new
    @specialty = Specialty.new
  end

  def create
    @specialty = Specialty.create(specialty_params)
    if @specialty
      redirect_to specialties_path
    else
      render :back
    end
  end

  private

    def specialty_params
      params.require(:specialty).permit([:name])
    end
end
