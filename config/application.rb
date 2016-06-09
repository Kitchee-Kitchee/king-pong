require 'sinatra/base'
require 'sinatra/activerecord'
require 'sinatra/reloader'
require 'will_paginate'
require 'will_paginate/active_record'

Dir.glob('./app/{models,controllers}/*.rb').each { |file| require file }

module KingPong
  Application = Rack::Builder.new do

    db_options = YAML.load(File.read('./config/database.yml'))[Sinatra::Base.environment.to_s]

    ActiveRecord::Base.establish_connection(db_options)

    map('/users'){ run UsersController }
    map('/games'){ run GamesController }
    map('/rankings'){ run RankingsController }
  end
end
