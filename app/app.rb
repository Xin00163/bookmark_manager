require 'sinatra/base'
require_relative 'data_mapper_setup'

ENV['RACK_ENV'] ||= 'development'

class BookmarkManager < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb :index
  end

  get '/links/new' do
    erb :add_link
  end

  post '/links' do
    link = Link.first_or_create(title: params[:title], url: params[:url])
    params[:tags].split(", ").each do |tag|
      a_tag = Tag.first_or_create(name: tag)
      link.tags << a_tag
      link.save
    end
    redirect to('/links')
  end

  get '/tag' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :tag_filter
  end

  get '/newtag' do
    erb :add_tag
  end

  post '/newtag' do
    tag = Tag.first_or_create(name: params[:tag])
    title = params[:title]
    link = Link.first(title: title)
    link.tags << tag
    link.save
    redirect '/links'
  end

  run! if app_file == $0
end
