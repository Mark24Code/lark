require 'sinatra/json'
require 'base_config'
require './base_app'
require 'json'

module DemoApiHelper
  # TODO   http://sequel.jeremyevans.net/rdoc/files/doc/cheat_sheet_rdoc.html#label-Limit-2FOffset
  def paginate(db_search)
    page = params.fetch(:page, 1).to_i
    page_size = params.fetch(:pageSize, 10).to_i

    total = db_search.all.count
    data = db_search.offset((page -1)*page_size).limit(page_size).all

    pagination = {
      page: page,
      pageSize: page_size,
      total: total
    }
    [ data, pagination ]
  end

end
class DemoApi < BaseApp
  include DemoApiHelper

  get '/demo' do
    
    json({
      code: 0,
      message: 'success',
      data: 'demo success', 
      pagination: pagination
    })
  end


end





# http://sinatrarb.com/contrib/json