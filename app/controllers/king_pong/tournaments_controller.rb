require 'king_pong/api_controller'
require 'king_pong/tournament'
require 'king_pong/user'
require 'king_pong/stat'

module KingPong
  class TournamentsController < ApiController

    # Gets all Tournaments in the system
    # @macro [attach] tournaments.get
    #   @overload get '$1'
    # @!method get_tournaments
    # @return [Array<Tournament>]
    get '/' do
      json Tournament.all
    end

    # @!method create_tournament
    # @overload post "/Tournaments",
    # Create a Tournament
    # @return [Tournament]
    post '/' do
      json Tournament.create!(params)
    end

    # @@!method get_tournament
    # @return [Tournament]
    # Gets a specific Tournament by id
    get '/:id' do |id|
      json Tournament.find(id)
    end

    # @@!method delete_tournament
    # Delete a specific Tournament by id
    # @return [Hash]
    delete '/:id' do |id|
      status = Tournament.find(id).destroy
      json deleted: status
    end

    # @@!method update_tournament
    # Update a specific tournament by id
    # @return [Tournament]
    patch '/:id' do |id|
      tournament = Tournament.find id
      tournament.update_attributes(params)
      json tournament
    end

    get '/:id/stats/:user_id' do |id, user_id|
      tournament = Tournament.find id
      user = User.find user_id
      json Stat.new(tournament, user, params)
    end
  end
end
