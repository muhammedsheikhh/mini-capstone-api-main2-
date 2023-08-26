class Report < ApplicationRecord     
    belongs_to :user

    before_create :set_default_date

  private

  def set_default_date
    self.date ||= Date.today
  end
end
