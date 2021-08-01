# frozen_string_literal: true

require 'app/base_app'
require 'sinatra/json'
require 'app/model/articles'
require 'app/app_logger'
require 'json'

class ArticleApi < BaseApp
  get '/:article_id' do
    puts '>>>>article get'
    article_id = params[:article_id]
    post = Articles.where(id: article_id).first

    resp = {
      id: post.id,
      title: post.title
    }

    json resp
  end

  post '/new' do
    # TODO my log cannot print
    article_id = params[:id]
    data = request.body.read
    payload = JSON.parse(data)
    logger.info '----------------nnnnnnnew'
    puts '>>>> new'
    puts article_id
    Articles.insert(
      id: payload['id'],
      title: payload['title']
    )

    json({
           code: 200,
           message: 'successful'
         })
  end
end
