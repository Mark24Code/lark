# frozen_string_literal: true

require './api/users'

map '/api/v1/users' do
  run Users
end
