module KingPong
  class EloRater

    DEFAULT_VALUE = 1000

    def default_attributes
      { value: DEFAULT_VALUE }
    end

    def update_ratings(game)
      winner = game.winner
      loser = game.loser
      winner_rating = winner.ratings.find_or_create(game.tournament)
      loser_rating = loser.ratings.find_or_create(game.tournament)
      winner_elo = to_elo(winner_rating)
      loser_elo = to_elo(loser_rating)

      winner_elo.wins_from(loser_elo)

      update_rating winner_rating, winner_elo
      update_rating loser_rating, loser_elo
    end

    def update_rating(rating, elo)
      Rating.transaction do
        rating.update_attributes!(value: elo.rating, pro: elo.pro?)
        rating.history_events.create(value: elo.rating)
      end
    end

    def to_elo(rating)
      Elo::Player.new(
        rating: rating.value,
        games_played: rating.user.games.where(tournament_id: rating.tournament_id).count,
        pro: rating.pro?
      )
    end
  end
end
