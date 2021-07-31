require_relative '../base_app'

class Users < BaseApp
  get '' do
    'users 23333'
  end

  get '/user' do
    'user profile'
  end
end
