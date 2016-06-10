require 'king_pong/resource'
require 'king_pong/elo_rater'

module KingPong
  class Tournament < Resource
    enum rater_algorithm: { elo: 0 }

    DEFAULT_RATERS = { elo: EloRater.new }.freeze

    has_many :games, inverse_of: :tournament, dependent: :destroy
    has_many :ratings, { inverse_of: :tournament, dependent: :destroy }, -> { order(:value).desc }

    # @todo Ability to chose another rater than ELO
    def rater
      DEFAULT_RATERS[rater_algorithm.to_sym]
    end
  end
end
