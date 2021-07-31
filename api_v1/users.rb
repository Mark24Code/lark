require 'sinatra/namespace'

class Users < Sinatra::Base
  get '' do
    'users'
  end

  get '/user' do
    'user profile'
  end
end
