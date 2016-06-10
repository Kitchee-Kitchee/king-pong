require 'will_paginate/active_record'
module KingPong
  class Resource < ::ActiveRecord::Base
    self.abstract_class = true

    def self.table_name_prefix
      'king_pong_'
    end
  end
end