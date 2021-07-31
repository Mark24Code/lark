require 'sequel'
require 'app/settings/config'

module Lark
  module DataBase
    database_config = Settings::DATABASE_CONFIG
    # https://sequel.jeremyevans.net/rdoc/files/doc/opening_databases_rdoc.html
    DB = Sequel.connect(database_config)
  end
end