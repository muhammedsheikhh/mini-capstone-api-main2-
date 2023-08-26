class ActivitiesController < ApplicationController
    before_action :authenticate_user
      
        def index
          activity = current_user.activities
          render json: activity
        end
      
        def create
          activity = Activity.new(
            user_id: current_user.id,
            activity_type: params[:activity_type],
            date: params[:date],
            detail: params[:detail],
            carbon_footprint: params[:carbon_footprint],
          )
          if activity.save
            
            render json: { message: "Activity sucessfully created" }, status: :created
          else
            render json: { errors: activity.errors.full_messages }, status: :unprocessable_entity
          end
        end
      
        def show
          activity = Activity.find_by(id: params[:id])
          render json: activity
        end
      
        def update
          activity = Activity.find_by(id: params[:id])
          activity.activity_type = params[:activity_type] || activity.activity_type
          activity.date = params[:date] || activity.date
          activity.detail = params[:detail] || activity.detail
          activity.carbon_footprint = params[:carbon_footprint] || activity.carbon_footprint
          if activity.save
            render json: { message: "Activity sucessfully updated" }
          else
            render json: { errors: activity.errors.full_messages }, status: :unprocessable_entity
          end
        end
      
        def destroy
          activity = Activity.find_by(id: params[:id])
          activity.destroy
          render json: { messege: "activity sucessfully deleted" }
        end
end
