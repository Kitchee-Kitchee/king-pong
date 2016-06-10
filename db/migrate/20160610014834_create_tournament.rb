class CreateTournament < ActiveRecord::Migration
  def change
    create_table :king_pong_tournaments do |t|
      t.string :name, null: false
      t.text :description
      t.integer :rater_algorithm, default: 0
      t.timestamps null: false
    end

    add_belongs_to(:king_pong_games, :tournament)
  end
end
