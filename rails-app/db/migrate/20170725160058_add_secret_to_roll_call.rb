class AddSecretToRollCall < ActiveRecord::Migration[5.1]
  def change
    add_column :roll_calls, :secret, :string
  end
end
