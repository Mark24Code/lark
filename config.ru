# frozen_string_literal: true
require_relative './helper'
require 'app/settings/config'
# require 'app/db/connect'
require 'app/api/users'

map '/api/v1/users' do
  run Users
end
