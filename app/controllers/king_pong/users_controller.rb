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
      json User.create!(params)
    end

    # @!method get_user
    # Gets a specific user by user_name
    # @return [User]
    get '/:user_name' do |user_name|
      json User.find_by!(user_name: user_name)
    end

    # @!method delete_user
    # Delete a specific user by user_name
    # @return [Hash]
    delete '/:user_name' do |user_name|
      status = User.find_by!(user_name: user_name).destroy
      json deleted: status
    end

    # @!method update_user
    # Update a specific user by user_name
    # @return [User]
    patch '/:user_name' do |user_name|
      user = User.find_by!(user_name: user_name)
      user.update_attributes(params)
      json user
    end
  end
end
