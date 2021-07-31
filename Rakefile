port = 4567

task :dev do
  require 'socket'
  my_address = Socket.ip_address_list.detect(&:ipv4_private?)

  puts "server run #{my_address.ip_address}:#{port}"
  exec("APP_ENV=development rackup -o 0.0.0.0 -p #{port}")
end

task :run do
  exec("APP_ENV=production rackup -o 0.0.0.0 -p #{port}")
end

task :get_random_key do
  require 'securerandom'
  puts SecureRandom.hex(64)
end

task :migrate do
  require_relative './prepare'
  puts '...'
  puts ENV['DATABASE_URL']
  puts $LARK_WORKDIR
  path_to_migration = File.expand_path(File.join($LARK_WORKDIR, './app/db/migrations'))
  puts path_to_migration
  DATABASE_URL = ENV['DATABASE_URL']
  puts DATABASE_URL

  cmd = "sequel -m #{path_to_migration} #{DATABASE_URL}"
  puts cmd
  exec(cmd)

  # TODO 无法eate data base need restart maybe
end

task default: %w[dev]
