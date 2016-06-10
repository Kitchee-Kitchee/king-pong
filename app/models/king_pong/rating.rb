module KingPong
  class Rating < Resource
    belongs_to :tournament
    belongs_to :user
    has_many :history_events, inverse_of: :rating, dependent: :delete_all
 end
end
