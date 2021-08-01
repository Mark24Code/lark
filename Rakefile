namespace :utils do
  desc 'generate random key'
  task :get_random_key do
    require 'securerandom'
    puts SecureRandom.hex(64)
  end
end

namespace :app do
  port = 4567

  desc 'Run development server'
  task :dev do
    require 'socket'
    my_address = Socket.ip_address_list.detect(&:ipv4_private?)

    puts "server run #{my_address.ip_address}:#{port}"
    exec("APP_ENV=development rackup -o 0.0.0.0 -p #{port}")
  end

  desc 'Run production server'
  task :run do
    exec("APP_ENV=production rackup -o 0.0.0.0 -p #{port}")
  end
end

namespace :db do
  desc 'Run migrations'
  task :migrate, [:version] do |t, args|
    # http://sequel.jeremyevans.net/rdoc/files/doc/migration_rdoc.html
    require 'sequel/core'
    Sequel.extension :migration
    version = args[:version].to_i if args[:version]
    Sequel.connect(ENV.fetch('DATABASE_URL')) do |db|
      Sequel::Migrator.run(db, 'app/db/migrations', target: version)
    end
  end
end


task default: %w[dev]

