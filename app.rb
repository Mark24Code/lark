require 'sinatra/base'
require 'sinatra/namespace'

# autoload :Users, './api_v1/users'
require './api_v1/users'


module Lark
  class App < Sinatra::Base
    register Sinatra::Namespace

    namespace '/api/v1' do
      use Users
    end
  end
end
