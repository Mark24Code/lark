# frozen_string_literal: true
require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/cors'
require 'sinatra/multi_route'
require 'setting/config'
require 'app/app_logger'

class BaseApp < Sinatra::Base

  configure :development, :production do
    # Session Secret
    set :session_secret, Lark::Setting::SECRET

    # logger
    # http://sinatrarb.com/contrib/custom_logger
    logger = Lark::CustomLogger::Clogger
    set :logger, logger

    # cors
    # https://github.com/jdesrosiers/sinatra-cors
    register Sinatra::Cors
    set :allow_origin, '*'
    # set :allow_origin, "http://example.com http://foo.com"
    set :allow_methods, 'GET,POST,PUT,DELETE,HEAD,OPTIONS'
    set :allow_headers, 'content-type,if-modified-since,allow_headers,authorization'
    # set :expose_headers, "location,link"

    # handler dsl extend
    # https://sinatrarb.com/contrib/multi_route
    register Sinatra::MultiRoute
  end

  configure :development do
    # reload
    # https://sinatrarb.com/contrib/reloader
    register Sinatra::Reloader
  end

  before do
    content_type :json
  end

  after do
    # logger.info response.body
  end
end
