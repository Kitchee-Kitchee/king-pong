require 'bundler'
Bundler.require

path = File.expand_path('../../app/{controllers,models}', __FILE__)
dirs = Dir.glob(path)
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
    map('/games'){ run GamesController }
    map('/rankings'){ run RankingsController }

  end
end
