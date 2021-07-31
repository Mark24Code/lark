require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/cors'
require 'logger'
require 'json'

class BaseApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  register Sinatra::Cors
  set :allow_origin, "*"
  # set :allow_origin, "http://example.com http://foo.com"
  set :allow_methods, "GET,POST,PUT,DELETE,HEAD,OPTIONS"
  set :allow_headers, "content-type,if-modified-since,allow_headers,authorization"
  # set :expose_headers, "location,link"


  before do
    content_type :json
  end

  after do
    response.body = response.body.to_json
    logger.info response.body
  end
end
