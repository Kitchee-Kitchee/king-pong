require 'king_pong/api_controller'

module KingPong
  class UsersController < ApiController

    # Gets all users in the system
    # @macro [attach] users.get
    #   @overload get '$1'
    # @!method get_users
    # @return [Array<User>]
    get '/' do
      json User.all
    end

    # @!method create_user
    # @overload post "/users",
    # Create a user
    # @return [User]
    post '/' do
      json User.create! params
    end

    # @method get_user
    # Gets a specific user by id
    # @return [User]
    get '/:id' do |id|
      json User.find id
    end

    # @method delete_user
    # Delete a specific user by id
    # @return [true|false]
    delete '/:id' do |id|
      status = User.find(id).destroy
      json deleted: status
    end

    patch '/:id' do |id|
      user = User.find id
      user.update_attributes(params)
      json user
    end
  end
end
