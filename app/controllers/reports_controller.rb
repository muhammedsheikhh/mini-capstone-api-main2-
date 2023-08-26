class ReportsController < ApplicationController
  before_action :authenticate_user
  before_action :set_report, only: [:show, :update, :destroy]

  def index
    reports = current_user.reports.includes(:user => :school).map do |report|
      {
        report: report,
        school: report.user.school
      }
    end
    render json: reports
  end

  # POST /reports
  def create
    activity = current_user.activities.find_by(id: params[:activity_id])
  unless activity
    render json: { error: "Activity not found" }, status: :not_found
    return
  end

    report = Report.new(
      user_id: current_user.id,
      date: Date.today,
      report_data: generate_report_data, # Assuming a method to generate the required data
      recommendations: generate_recommendations(activity.carbon_footprint)
    )
    if report.save
      render json: { message: "Report successfully created" }, status: :created
    else
      render json: { errors: report.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # GET /reports/:id
  def show
    report_with_school = {
    report: @report.attributes,
    school: @report.user.school.attributes
  }
  render json: report_with_school
  end

  # PUT or PATCH /reports/:id
  def update
    @report.report_data = params[:report_data] || @report.report_data
    @report.recommendations = params[:recommendations] || @report.recommendations
    if @report.save
      render json: { message: "Report successfully updated" }
    else
      render json: { errors: @report.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /reports/:id
  def destroy
    @report.destroy
    render json: { message: "Report successfully deleted" }
  end

  private

  def set_report
    @report = current_user.reports.find_by(id: params[:id])
    unless @report
      render json: { error: "Report not found" }, status: :not_found
    end
  end

  # Assuming a simple method that aggregates data for report generation.
  def generate_report_data
    activity = current_user.activities.find(params[:activity_id])
    "Your Activity: #{activity.detail}, Carbon Footprint: #{activity.carbon_footprint}"
  end

  def generate_recommendations(footprint)
    case footprint
    when "major"
      return <<-RECOMMENDATIONS
      
- Reduce Frequency: Try to engage in this activity less often.,
- Eco-friendly Alternatives: Look for sustainable alternatives.,
- Offset Emissions: Consider investing in carbon offsets.,
- Stay Informed: Regularly read about the environmental impacts.
    
      RECOMMENDATIONS
    when "minor"
      return <<-RECOMMENDATIONS
- Sustainable Improvements: Look for ways to make this activity more sustainable.
- Maintain Awareness: Keep updated with new information.
- Eco-friendly Products: Choose products made sustainably.
- Encourage Others: Share your knowledge.
      RECOMMENDATIONS
    when "regular"
      return <<-RECOMMENDATIONS
  
- Balanced Approach: Maintain a balance with this activity.,
- Routine Checks: Periodically review this activity.,
- Localize Activities: Try to reduce transport emissions.,
- Recycle and Reuse: Ensure you're recycling or reusing.,
    
      RECOMMENDATIONS
    end
 end
  
end
