require 'king_pong/resource'

module KingPong
  class Game < Resource
    # Using polymorphic association as we will use this for teams and users indifferently
    belongs_to :loser, polymorphic: true, inverse_of: :lost_games
    belongs_to :winner, polymorphic: true, inverse_of: :won_games

    serialize :details, Oj

    validates :loser_id, presence: true
    validates :winner_id, presence: true
    validates :loser_score, numericality:  {only_integer: true, greater_than_or_equal_to: 0}
    validates :winner_score, numericality:  {only_integer: true, greater_than_or_equal_to: 0}
  end
end
