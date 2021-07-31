module Lark
  module Settings
    DbConfig = {
      adapter: 'postgres',
      host: 'localhost',
      database: 'blog',
      user: 'user',
      password: 'password'
    }
    SECRET = 'you cannot see me'.freeze
  end
end

# TODO read from ENV & provide default
