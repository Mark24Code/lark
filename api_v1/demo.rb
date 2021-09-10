require 'sinatra/json'
require 'base_config'
require './base_app'
require 'json'

class DemoApi < BaseApp
  get '/' do
    
    json({
    code: 0,
    message: 'success',
    data: 'demo success', 
  })
  end
end

# http://sinatrarb.com/contrib/json