require 'sinatra/base'
require "sinatra/session"
require_relative 'game'

class Slot < Sinatra::Base

  # force port 3000 for Nitrous development
  configure :development do
    set :bind, '0.0.0.0'
    set :port, 3000
  end

  enable :sessions
  set :views, proc { File.join(root, '..', 'views') }

  get '/' do
    session[:coins] = 10
    erb :index
  end

  post '/' do
    @play = 1
    session[:coins]=session[:coins]-1
    erb :index
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
