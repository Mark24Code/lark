require './api/users'

map '/api/v1/users' do
  run Users
end