require 'logger'

module Lark
  module CustomLogger
    # http://sinatrarb.com/contrib/custom_logger
    environment = ENV['APP_ENV'] || 'development'
    logger = Logger.new(File.open("#{Lark::Setting::LOG_DIR}/log/#{environment}.log", 'a'))
    logger.level = Logger::DEBUG if environment == 'development'

    Clogger = logger
  end
end