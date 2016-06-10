require 'king_pong/api_controller'

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

    # @method get_tournament
    # Gets a specific Tournament by id
    # @return [Tournament]
    get '/:id' do |id|
      json Tournament.find(id)
    end

    # @method delete_tournament
    # Delete a specific Tournament by id
    # @return [Hash]
    delete '/:id' do |id|
      status = Tournament.find(id).destroy
      json deleted: status
    end

    # @method update_tournament
    # Update a specific tournament by id
    # @return [Tournament]
    patch '/:id' do |id|
      tournament = Tournament.find id
      tournament.update_attributes(params)
      json tournament
    end
  end
end
