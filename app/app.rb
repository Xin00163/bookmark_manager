ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'


class BookmarkManager < Sinatra::Base
  enable :sessions
  set :session_secret, 'session'
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/users/new' do
    @user = User.new
    erb :login
  end

  post '/users/new' do
    @user = User.new(email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/links'
    else
      flash.now[:notice] = "Password and confirmation password do not match"
      erb :login
    end
  end

  get '/links' do
    current_user
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
    end
    link.save
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
