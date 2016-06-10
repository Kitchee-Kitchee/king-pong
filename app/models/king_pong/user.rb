require 'king_pong/resource'

module KingPong
  class User < Resource
    validates :email, presence: true, uniqueness: true
    validates :user_name, presence: true, uniqueness: true

    has_many :won_games, as: :winner, class_name: 'Game', inverse_of: :winner
    has_many :lost_games, as: :loser, class_name: 'Game', inverse_of: :loser
  end
end
