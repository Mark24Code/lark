require 'sinatra/base'
require 'sinatra/config_file'
require 'sinatra/reloader'
require "sinatra/multi_route"
require 'sinatra/cors'
require 'sinatra/custom_logger'
require 'logger'
require 'puma'

# Modular vs. Classic Style  http://sinatrarb.com/intro.html
class BaseApp < Sinatra::Base
  # load config (user part)
  register Sinatra::ConfigFile
  config_file 'config.yml'
  
  # cofig (rest part)
  configure do
    # http://sinatrarb.com/contrib/multi_route
    register Sinatra::MultiRoute

    # https://github.com/jdesrosiers/sinatra-cors
    register Sinatra::Cors
    set :allow_origin, '*'
    set :allow_methods, 'GET,POST,PUT,DELETE,HEAD,OPTIONS'
    set :allow_headers, 'content-type,if-modified-since,allow_headers,authorization'

    set :server, :puma
    set :server_settings, :Threads => "0:#{settings.max_threads}", :Verbose => true
  end

  configure :development do
    register Sinatra::Reloader
  end

  # logger
  helpers Sinatra::CustomLogger
  configure :development, :production do
    require_relative './base_logger'
    set :logger, Base::BASE_LOGGER
  end
end
