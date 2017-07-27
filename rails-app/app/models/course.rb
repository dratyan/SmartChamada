class Course < ApplicationRecord
  belongs_to :user
  has_many :roll_calls
end
