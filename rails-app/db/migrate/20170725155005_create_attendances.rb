class CreateAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :attendances do |t|
      t.datetime :received
      t.string :cartao
      t.references :roll_call, index: true

      t.timestamps
    end
  end
end
