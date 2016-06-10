require 'king_pong/api_controller'

module KingPong
  class GamesController < ApiController

    # Gets all Games in the system
    # @macro [attach] games.get
    #   @overload get '$1'
    # @!method get_games
    # @return [Array<Game>]
    get '/' do
      json Game.all
    end

    # @!method create_game
    # @overload post "/Games",
    # Create a Game
    # @return [Game]
    post '/' do
      json Game.create!(params)
    end

    # @method get_game
    # Gets a specific Game by id
    # @return [Game]
    get '/:id' do |id|
      json Game.find(id)
    end

    # @method delete_game
    # Delete a specific Game by id
    # @return [Hash]
    delete '/:id' do |id|
      status = Game.find(id).destroy
      json deleted: status
    end

    # @method update_game
    # Update a specific game by id
    # @return [Game]
    patch '/:id' do |id|
      game = Game.find id
      game.update_attributes(params)
      json game
    end
  end
end
