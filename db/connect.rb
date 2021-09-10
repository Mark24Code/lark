require 'sequel'
require_relative '../base_config'
require 'logger'
require 'base_logger'
# database
# https://sequel.jeremyevans.net/rdoc/files/doc/opening_databases_rdoc.html
DB = Sequel.connect(
  adapter: Base::Config['adapter'], 
  host: Base::Config['database_host'], 
  port: Base::Config['database_port'], 
  user: Base::Config['database_username'], 
  password: Base::Config['database_password'],
  database: Base::Config['database'], 
  logger: Base::BASE_LOGGER
)
# if ENV.fetch('APP_ENV') {'development'} == 'development'
#   DB.sql_log_level = :debug
# end
# DB.loggers << Logger.new($stdout)


# Postgresql JSON/JOSNB support
# https://sequel.jeremyevans.net/rdoc-plugins/files/lib/sequel/extensions/pg_json_rb.html
# https://sequel.jeremyevans.net/rdoc-plugins/files/lib/sequel/extensions/pg_json_ops_rb.html

Sequel.extension :pg_json_ops 
DB.extension :pg_json
DB.wrap_json_primitives = true
