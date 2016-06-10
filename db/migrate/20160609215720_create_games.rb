class CreateGames < ActiveRecord::Migration
  def change
    create_table :king_pong_games do |t|
      t.binary :details
      t.references :winner, polymorphic: true, index: true
      t.references :loser, polymorphic: true, index: true
      t.integer :winner_score
      t.integer :loser_score
      t.timestamps null: false
    end
  end
end
