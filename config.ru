# frozen_string_literal: true
require_relative './prepare'
require 'app/setting/config'
require 'app/app_logger'
require 'app/db/connect'
require 'app/api/article'

# map and plugin apps
map '/api/v1/articles' do
  run ArticleApi
end
