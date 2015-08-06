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
      redirect to specialties_path
    else
      render :back
    end
  end
end
