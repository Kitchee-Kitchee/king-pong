require 'king_pong/resource'

module KingPong
  class User < Resource
    validates :email, presence: true, uniqueness: true
    validates :user_name, presence: true, uniqueness: true
  end
end
