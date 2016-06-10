class CreateRating < ActiveRecord::Migration
  def change
    create_table :king_pong_ratings do |t|
      t.integer :value, null: false
      t.boolean :pro, default: false
      t.belongs_to :tournament
      t.belongs_to :user
      t.timestamps null: false
    end
  end
end
