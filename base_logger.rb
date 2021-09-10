require 'logger'

module Base
  environment = ENV['APP_ENV'] || 'development'
  logger = Logger.new(File.open(File.expand_path(File.join(__FILE__,"..","/log/#{environment}.log")), 'a'))
  logger.level = Logger::DEBUG if environment == 'development'

  BASE_LOGGER = logger
end