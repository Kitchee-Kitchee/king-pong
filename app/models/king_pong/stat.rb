module KingPong
  class Stat
    def initialize(tournament, user, options = {})
      @tournament = tournament
      @user = user
      @page = options[:page] || 1
      @per_page = options[:per_page] || 25
    end

    def as_json
      {
        tournament: @tournament.as_json(only: [:name, :description]),
        stats: @user.recent_ratings(@tournament.id, @page, @per_page)
      }
    end
  end
end
