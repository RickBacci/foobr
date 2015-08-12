class SpecialtiesController < ApplicationController
  respond_to :json, :html

  def index
    @specialties = Specialty.pluck(:specialty_name).uniq
  end

  def new
    @specialty = current_user.specialties.new
  end

  def create
    @specialty = current_user.specialties.create(specialty_params)
    if @specialty
      respond_with @specialty
    else
      # TODO: respond with errors
    end
  end

  def get_specialties
    respond_with Specialty.all, location: nil
  end

  private

    def specialty_params
      params.require(:specialty).permit([:specialty_name])
    end
end
