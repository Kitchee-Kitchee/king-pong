require 'king_pong/resource'

module KingPong
  class HistoryEvent < Resource
    belongs_to :rating, inverse_of: :history_events
    validates :value, presence: true
  end
end
