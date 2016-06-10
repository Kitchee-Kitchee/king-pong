module KingPong
  class Tournament < Resource
    has_many :games, dependent: :destroy
  end
end
