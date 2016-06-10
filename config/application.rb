require 'rubygems'
require 'bundler/setup'
require 'sinatra'

Bundler.require(:default, Sinatra::Base.environment)

path = File.expand_path('../../app/{controllers,models,helpers,services}', __FILE__)
dirs = Dir.glob(path)
dirs << File.expand_path('../../lib', __FILE__)

$LOAD_PATH.concat(dirs)

Dir.glob('./lib/**/*.rb').each { |file|  require file }
Dir.glob(path + '/**/*.rb').each { |file| require file }

module KingPong
  Application = Rack::Builder.new do

    db_options = YAML.load(File.read('./config/database.yml'))[Sinatra::Base.environment.to_s]

    ActiveRecord::Base.establish_connection(db_options)

    use Rack::Parser, parsers: {
      %r{json} => OjEncoder.new
    }

    map('/users'){ run UsersController }
    map('/tournaments'){ run TournamentsController }
    map('/games'){ run GamesController }
    map('/leaderboards'){ run LeaderboardsController }

  end
end
