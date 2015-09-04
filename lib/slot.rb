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
  set :public, proc { File.join(root, '..', 'public') }

  get '/' do
    session[:coins] = 10
    session[:reel1] = 9
    session[:reel2] = 9
    session[:reel3] = 9
    session[:buttons] = 0
    session[:hold1] = 0
    session[:hold2] = 0
    session[:hold3] = 0
    session[:nudges] = 0
    session[:nudge1] = 0
    session[:nudge2] = 0
    session[:nudge3] = 0
    erb :index
  end

  post '/' do
    @play = 1
    @reel1 = rand(3..9)
    @reel2 = rand(5..9)
    @reel3 = rand(7..9)
    session[:coins]=session[:coins]-1
    session[:buttons]=rand(9)
    session[:nudges]=1
    erb :index
  end

  get '/hold1' do
    session[:hold1]=1
    erb :index
  end

  get '/hold2' do
    session[:hold2]=1
    erb :index
  end

  get '/hold3' do
    session[:hold3]=1
    erb :index
  end

  get '/nudge1' do
    session[:nudge1]=1
    session[:nudges]=2
    erb :index
  end

  get '/nudge2' do
    session[:nudge2]=1
    session[:nudges]=2
    erb :index
  end

  get '/nudge3' do
    session[:nudge3]=1
    session[:nudges]=2
    erb :index
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end