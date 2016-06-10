module KingPong
  class Leaderboard
    def initialize(tournament)
      @tournament = tournament
    end

    def leaderboard
      @tournament.ratings.each_with_index.map do |rating, index|
        {
          rank: index + 1,
          rating: rating.value,
          user_name: rating.user.user_name,
          user_id: rating.user.id
        }
      end
    end

    def as_json
      @tournament.as_json.merge(leaderboard: leaderboard)
    end
  end
end
