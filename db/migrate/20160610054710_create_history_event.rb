class CreateHistoryEvent < ActiveRecord::Migration
  def change
    create_table :king_pong_history_events do |t|
      t.integer :value
      t.belongs_to :rating
      t.timestamps null: false
    end
  end
end
