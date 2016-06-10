require 'king_pong/api_controller'
require 'king_pong/tournament'
require 'king_pong/leaderboard'

module KingPong
  class LeaderboardsController < ApiController
    get '/:id' do |id|
      tournament = Tournament.find id
      json Leaderboard.new(tournament)
    end
  end
end
