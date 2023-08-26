require 'rails_helper'

RSpec.describe School, type: :model do
  it "is valid with valid attributes" do
    school = School.new(
      energy_consumption: 100,
      waste_management: 200,
      transportation: 300,
      other_factors: 100,
      carbon_footprint: "low"
    )
    expect(school).to be_valid
  end

  

end
