class SpecialtiesController < ApplicationController
  respond_to :json

  def index
    @specialties = Specialty.pluck(:specialty_name).uniq
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

  def destroy
    specialty = Specialty.find(params[:id])
    current_user.specialties.delete(specialty)

    redirect_to current_user
  end

  def get_specialties
    respond_with Specialty.all, location: nil
  end

  private

    def specialty_params
      params.require(:specialty).permit([:specialty_name])
    end
end
