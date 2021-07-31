require 'sinatra/namespace'

class API_V1 < Sinatra::Base
  register Sinatra::Namespace

  namespace '/users' do
    get '' do
      'users'
    end

    get '/user' do
      'user profile'
    end
  end
end
