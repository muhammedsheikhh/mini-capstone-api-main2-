class Activity < ApplicationRecord
    belongs_to :user
    VALID_CARBON_FOOTPRINTS = ['major', 'minor', 'regular'].freeze
    validates :carbon_footprint, inclusion: { in: VALID_CARBON_FOOTPRINTS, message: "%{value} is not a valid carbon footprint" }
end
