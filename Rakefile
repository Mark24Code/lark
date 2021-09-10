require "sequel"
require_relative './base_config'
require_relative './base_logger'

namespace :db do
  MIGRATION_DIR = 'db/migrations'

  desc "Connect database"
  task :connect do
    require 'logger'
    Sequel.extension :migration
    DB = Sequel.connect(
          adapter: Base::Config['adapter'], 
          host: Base::Config['database_host'], 
          port: Base::Config['database_port'], 
          user: Base::Config['database_username'], 
          password: Base::Config['database_password'],
          database: Base::Config['database'], 
          logger: Logger.new($stdout)
        )
    DATABASE_URL = "#{Base::Config['adapter']}://#{Base::Config['database_username']}:#{Base::Config['database_password']}@#{Base::Config['database_host']}:#{Base::Config['database_port']}/#{Base::Config['database']}"
  end


  desc "Create database"
  task :create do
    db_name = Base::Config['database']
    puts "CREATEDB: #{db_name}"
    system("createdb #{db_name}")
  end

  desc "Drop database"
  task :drop do
    db_name = Base::Config['database']
    puts "DROPDB: #{db_name}"
    system("dropdb #{db_name}")
  end

  desc "Create a migration"
  task :create_migration, [:name] => :connect do |t, args|
    raise("Name required") unless args[:name]

    # http://sequel.jeremyevans.net/rdoc/files/doc/migration_rdoc.html#label-TimestampMigrator+Filenames
    timestamp = Time.now.strftime("%Y%m%d%H%M%S")
    path = "db/migrations/#{timestamp}_#{args[:name]}.rb"

    File.open("#{path}", "w") do |f|
      f.write(<<-MIGRATION_TEMPLATE
# http://sequel.jeremyevans.net/rdoc/files/doc/migration_rdoc.html
Sequel.migration do  

  # change do
  
  # end


  # up do

  # end


  # down do

  # end

  # You can find some userful info
  # http://sequel.jeremyevans.net/rdoc/files/doc/schema_modification_rdoc.html
end
MIGRATION_TEMPLATE
)
    end

    puts "MIGRATION CREATED: #{path}"
  end


  # http://sequel.jeremyevans.net/rdoc/files/doc/migration_rdoc.html#label-Running+migrations
  desc "Run migrations"
  task :migrate, [:version] => :connect do |t, args|
    if args[:version]
      Sequel::Migrator.run(DB, MIGRATION_DIR, target: args[:version].to_i)
    else
      Sequel::Migrator.run(DB, MIGRATION_DIR)
    end


    if ENV.fetch("APP_ENV") { 'development' } == "development"
      # http://sequel.jeremyevans.net/rdoc/files/doc/migration_rdoc.html#label-Dumping+the+current+schema+as+a+migration
      # -d ruby style
      # system("sequel -d #{DATABASE_URL} > #{MIGRATION_DIR}/schema.rb")
      # # -D database style
      system("sequel -D #{DATABASE_URL} > #{MIGRATION_DIR}/schema.rb")
    end

    Rake::Task["db:version"].execute
  end


  desc "Checking for current migrations"
  task :check => :connect do
    puts "DB Check: if migration is update:"
    puts Sequel::Migrator.is_current?(DB, MIGRATION_DIR)
  end


  # http://sequel.jeremyevans.net/rdoc/files/doc/migration_rdoc.html#label-Running+migrations
  desc "Rollback to migration"
  task :rollback, [:version]  => :connect do |t|
    version = if DB.tables.include?(:schema_migrations)
                previous = DB[:schema_migrations].order(Sequel.desc(:filename)).limit(2).all[1]
                previous ? previous[:filename].split("_").first : nil
              end || 0

    Sequel::Migrator.run(DB, MIGRATION_DIR, target: version.to_i)

    if ENV["APP_ENV"] == "development"
      system("sequel -d #{DATABASE_URL} > #{db_dir}/schema.rb")
    end

    Rake::Task["db:version"].execute
  end


  desc "Prints current schema version"
  task :version => :connect do    
    filename = if DB.tables.include?(:schema_migrations)
      DB[:schema_migrations].order(Sequel.desc(:filename)).first[:filename]
    end || 0

    version, rest = filename.split('_')
    puts "Schema Version: #{version}"
    puts "Migration: #{filename}"
  end

  desc "List database tables"
  task :ls => :connect do    
    puts "DB:"
    puts ":host => #{Base::Config['database_host']}"
    puts ":database => #{Base::Config['database']}"
    puts "Tables:"
    system("sequel -c 'p DB.tables' #{DATABASE_URL}")
  end

  # https://github.com/jeremyevans/sequel/blob/master/doc/bin_sequel.rdoc#label-Not+Just+an+IRB+shell
  desc "Database Console"
  task :console => :connect do    
    puts "Sequel Console:"
    system("sequel #{DATABASE_URL}")
  end
end


namespace :server do
  desc "Run server"
  task :run do
    server_host = ENV.fetch('HOST') { '0.0.0.0' } 
    server_port = ENV.fetch('PORT') { 3000 }
    server_max_threads = ENV.fetch('MAX_THREADS') { 5 }
    app_env = ENV.fetch('APP_ENV') { 'development' }
    exec("APP_ENV=#{app_env} RACK_ENV=#{app_env} rackup -o #{server_host} -p #{server_port} -O 0:#{server_max_threads}")
  end
end