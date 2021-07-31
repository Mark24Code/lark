# frozen_string_literal: true

require 'app/base_app'
require 'sinatra/json'

class Users < BaseApp
  get '' do
    json foo: 'bar'
  end

  get '/user' do
    result = {
      name: 'user profile'
    }
    json result
  end
end
