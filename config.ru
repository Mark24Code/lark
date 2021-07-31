require 'sinatra/base'

require './api_v1/users.rb'


map('/api/v1') do
  run Users
end

