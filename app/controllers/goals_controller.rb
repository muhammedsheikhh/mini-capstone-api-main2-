class GoalsController < ApplicationController
    before_action :authenticate_user
      
        def index
          goal = current_user.goals
          render json: goal
        end
      
        def create
          goal = Goal.new(
            user_id: current_user.id,
            description: params[:description],
            startdate: params[:startdate],
            enddate: params[:enddate],
            status: params[:status],
            achivemet: params[:achivemet],
          )
          if goal.save
            
            render json: { message: "Goal sucessfully created" }, status: :created
          else
            render json: { errors: goal.errors.full_messages }, status: :unprocessable_entity
          end
        end
      
        def show
          goal = Goal.find_by(id: params[:id])
          render json: goal
        end
      
        def update
          goal = Goal.find_by(id: params[:id])
          goal.description = params[:description] || goal.description
          goal.startdate = params[:startdate] || goal.startdate
          goal.enddate = params[:enddate] || goal.enddate
          goal.status = params[:status] || goal.status
          goal.achivemet = params[:achivemet] || goal.achivemet
          if goal.save
            render json: { message: "Goal sucessfully updated" }
          else
            render json: { errors: goal.errors.full_messages }, status: :unprocessable_entity
          end
        end
      
        def destroy
          goal = Goal.find_by(id: params[:id])
          goal.destroy
          render json: { messege: "goal sucessfully deleted" }
        end
      
end
