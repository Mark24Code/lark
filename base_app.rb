require 'sinatra/base'
require 'sinatra/reloader'

class BaseApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
end
