class CreateRollCalls < ActiveRecord::Migration[5.1]
  def change
    create_table :roll_calls do |t|
      t.date :call_date

      t.timestamps
    end
  end
end
