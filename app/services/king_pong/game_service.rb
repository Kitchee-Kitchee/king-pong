module KingPong
  class GameService
    def initialize(params)
      @params = params.dup
    end

    def create!
      winner = ::KingPong::User.find params.delete('winner_id')
      loser = ::KingPong::User.find params.delete('loser_id')
      ::KingPong::Game.create! params.merge(winner: winner, loser: loser)
    end
  end
end
