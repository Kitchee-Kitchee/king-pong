require "sinatra/json"

module KingPong
  class ApplicationController < Sinatra::Base
    set :root, File.expand_path('../../../../', __FILE__)
    set :views, proc { File.join(root, 'app/views') }
    set :public_folder, proc { File.join(root, 'public') }

    configure :development do
      # Actually handles error like in production
      set :show_exceptions, :after_handler
      # reload the files
      # new files requires the server to be restarted
      register Sinatra::Reloader
    end
  end
end
