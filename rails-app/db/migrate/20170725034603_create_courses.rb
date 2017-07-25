class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :location
      t.references :user, index: true

      t.timestamps
    end
  end
end
