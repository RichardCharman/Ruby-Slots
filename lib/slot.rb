require 'sinatra/base'

class Slot < Sinatra::Base

  # force port 3000 for Nitrous development
  configure :development do
    set :bind, '0.0.0.0'
    set :port, 3000
  end

  set :views, proc { File.join(root, '..', 'views') }

  get '/' do
    erb :index
  end

  post '/' do
    @play = 1
    erb :index
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
