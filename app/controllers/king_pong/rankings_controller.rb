require 'king_pong/api_controller'

module KingPong
  class RankingsController < ApiController
    get '/' do |id|
      'No games played yet! Please give some love to this project!'
    end
  end
end
