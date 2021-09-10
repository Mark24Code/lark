require_relative './prepare'
require_relative 'db/connect'

require 'app'
require 'api_v1/demo'

# Secure Middleware
# require 'rack/protection'
# use Rack::Protection
run MyApp

map '/api/v1/demo' do
  run DemoApi
end