class School < ApplicationRecord
    has_many :user

  validates :energy_consumption, :waste_management, :transportation, :other_factors, :carbon_footprint, presence: true
end
