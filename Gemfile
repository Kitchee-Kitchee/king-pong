source 'https://rubygems.org'

ruby '~> 2.3'

# ELO ranking library
gem 'elo'

gem 'sinatra', '~> 1.4.7'
gem 'sinatra-contrib', '~> 1.4.7'
gem 'sinatra-activerecord', github: 'janko-m/sinatra-activerecord'
gem 'sqlite3'
gem 'activerecord', '~> 4.2'

gem 'rack-parser', :require => 'rack/parser'
gem 'oj', '~> 2.15.1'
gem 'oj_mimic_json', '~> 1.0.1'

# sinatra-reloader should only be required in development or test ... must be fixed
gem 'sinatra-reloader'
gem 'will_paginate'

group :development do
  gem 'sinatra-reloader'
  gem 'yard'
end

group :development, :test do
  gem 'pry'
  gem 'pry-byebug'
end
