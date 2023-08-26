class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  has_many :goals
  has_many :activities
  has_many :reports
  belongs_to :school, optional: true

 
end
