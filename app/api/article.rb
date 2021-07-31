# frozen_string_literal: true

require 'app/base_app'
require 'sinatra/json'
require 'app/model/articles'

class ArticleApi < BaseApp
  get '/:article_id' do
    article_id = params[:id]
    post = Articles.where(id: article_id).first

    resp = {
      title: post.title
    }

    json resp
  end

  post '' do
    article_id = params[:id]
    Articles.insert(
      name: "post#{article_id}"
    )

    json({
           code: 200,
           message: 'successful'
         })
  end
end
