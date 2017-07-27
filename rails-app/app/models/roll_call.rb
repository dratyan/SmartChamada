class RollCall < ApplicationRecord
  has_many :attendances
  belongs_to :course
end
