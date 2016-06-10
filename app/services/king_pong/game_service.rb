require 'king_pong/user'
require 'king_pong/tournament'

module KingPong
  class GameService
    def initialize(params)
      @params = params.dup
    end

    def create!
      winner = ::KingPong::User.find_by! user_name: params.delete('winner')
      loser = ::KingPong::User.find_by! user_name: params.delete('loser')
      tournament = ::KingPong::Tournament.find params.delete('tournament_id')
      tournament.games.create! params.merge(winner: winner, loser: loser)
    end
  end
end
