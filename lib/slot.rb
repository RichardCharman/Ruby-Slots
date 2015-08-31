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
    session[:reel1] = 0
    session[:reel2] = 0
    session[:reel3] = 0
    erb :index
  end

  post '/' do
    @play = 1
    @reel1 = rand(4..10)
    @reel2 = rand(6..10)
    @reel3 = rand(8..10)
    session[:coins]=session[:coins]-1
    erb :index
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
