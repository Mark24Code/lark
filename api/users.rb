require_relative '../base_app'

class Users < BaseApp
  get '' do
    {
      name: 'Users List'
    }
  end

  get '/user' do
    {
      name: 'User Profile'
    }
  end
end
