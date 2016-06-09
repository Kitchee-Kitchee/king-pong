module KingPong
  class User < ActiveRecord::Base
    validates :email, presence: true, uniqueness: true
    validates :user_name, presence: true, uniqueness: true
  end
end
