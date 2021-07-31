port = 4567

task :dev do
  require 'socket'
  my_address = Socket.ip_address_list.detect(&:ipv4_private?)

  puts "server run #{my_address.ip_address}:#{port}"
  exec("rackup -o 0.0.0.0 -p #{port}")
end

task :run do
  exec("rackup -o 0.0.0.0 -p #{port}")
end

task default: %w[dev]
