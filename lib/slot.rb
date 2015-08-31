require 'sinatra/base'

class Slot < Sinatra::Base

  # force port 3000 for Nitrous development
  configure :development do
    set :bind, '0.0.0.0'
    set :port, 3000
  end

  get '/' do
    'Hello Slot!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
