class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :nome
      t.string :username
      t.string :cartao
      t.string :password_digest

      t.timestamps
    end
  end
end
