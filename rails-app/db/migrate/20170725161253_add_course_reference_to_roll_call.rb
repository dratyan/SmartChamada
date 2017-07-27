class AddCourseReferenceToRollCall < ActiveRecord::Migration[5.1]
  def change
    add_reference :roll_calls, :course, index: true
  end
end
