class SchoolsController < ApplicationController
 

  def index
    schools = School.all
    render json: schools
  end

  def create
    school = School.new(
            energy_consumption: params[:energy_consumption],
            waste_management: params[:waste_management],
            transportation: params[:transportation],
            other_factors: params[:other_factors],
            carbon_footprint: params[:carbon_footprint],
          )
    if school.save
      render json: { message: "School data successfully created" }, status: :created
    else
      render json: { errors: school.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    school = School.find_by(id: params[:id])
    render json: school
  end

  def update
    if @school.update(school_params)
      render json: { message: "School data successfully updated" }
    else
      render json: { errors: @school.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @school.destroy
    render json: { message: "School data successfully deleted" }
  end

  private

  def set_school
    @school = current_user.schools.find_by(id: params[:id])
    unless @school
      render json: { error: "School not found" }, status: :not_found
    end
  end

  def school_params
    params.require(:school).permit(:energy_consumption, :waste_management, :transportation, :other_factors, :carbon_footprint)
  end
end
