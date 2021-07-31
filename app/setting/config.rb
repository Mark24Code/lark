# setting
require 'prepare'
require 'securerandom'

module Lark
  module Setting
    SECRET = ENV.fetch('SESSION_SECRET') { SecureRandom.hex(64) }

    DATABASE_URL = ENV.fetch('DATABASE_URL') do
      puts "[Settings Warning] Not Found ENV: DATABASE_URL\n Use Sqlite3 as default database."
      "database.#{ENV['APP_ENV'] || 'develop'}.sqlite3"
    end

    LOG_DIR = ENV['LOG_DIR'] || $LARK_WORKDIR
  end
end

# TODO read from ENV & provide default
