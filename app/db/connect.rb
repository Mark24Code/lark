require 'sequel'
require 'app/setting/config'
require 'logger'

module Lark
  module DataBase
    db_url = Setting::DATABASE_URL
    puts '>>>>>>>>>.'
    puts db_url
    # https://sequel.jeremyevans.net/rdoc/files/doc/opening_databases_rdoc.html
    DB = Sequel.connect(db_url, logger: Logger.new($stderr))
  end
end