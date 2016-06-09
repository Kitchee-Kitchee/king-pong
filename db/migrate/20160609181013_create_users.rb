class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name, null: false
      t.string :email, null: false

      t.index :user_name, unique: true
      t.index :email, unique: true
      t.timestamps
    end
  end
end
