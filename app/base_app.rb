# frozen_string_literal: true
require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/cors'
require 'sinatra/multi_route'
require 'logger'

class BaseApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  register Sinatra::Cors
  set :allow_origin, '*'
  # set :allow_origin, "http://example.com http://foo.com"
  set :allow_methods, 'GET,POST,PUT,DELETE,HEAD,OPTIONS'
  set :allow_headers, 'content-type,if-modified-since,allow_headers,authorization'
  # set :expose_headers, "location,link"

  register Sinatra::MultiRoute
  before do
    content_type :json
  end

  after do
    # logger.info response.body
  end
end
