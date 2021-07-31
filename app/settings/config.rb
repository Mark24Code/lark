module Lark
  module Settings
    DATABASE_CONFIG = {
      adapter: ENV['DB_ADAPTER'] || 'postgres',
      host: ENV['DB_HOST'] || 'localhost',
      database: ENV['DB_DATABASE'] || 'postgres',
      user: ENV['DB_USER'],
      password: ENV['DB_PASSWORD']
    }.freeze

    SECRET = 'you cannot see me'.freeze
  end
end

# TODO read from ENV & provide default
