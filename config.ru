require 'sinatra/base'
require './api/v1'

map('/api/v1') do
  run API_V1
end

