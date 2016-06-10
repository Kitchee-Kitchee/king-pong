require 'king_pong/resource'

module KingPong
  class User < Resource
    validates :email, presence: true, uniqueness: true
    validates :user_name, presence: true, uniqueness: true

    has_many :won_games, as: :winner, class_name: 'Game', inverse_of: :winner
    has_many :lost_games, as: :loser, class_name: 'Game', inverse_of: :loser

    has_many :ratings, inverse_of: :user, dependent: :destroy do
      def find_or_create(tournament)
        where(tournament_id: tournament.id).first || create({tournament_id: tournament.id}.merge(tournament.rater.default_attributes))
      end
    end

    def games
      Game.where("winner_id = ? OR loser_id = ?", id, id)
    end
  end
end
