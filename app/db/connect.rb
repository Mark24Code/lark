require 'sequel'
require 'app/setting/config'

module Lark
  module DataBase
    db_url = Setting::DATABASE_URL
    # https://sequel.jeremyevans.net/rdoc/files/doc/opening_databases_rdoc.html
    DB = Sequel.connect(db_url)
  end
end