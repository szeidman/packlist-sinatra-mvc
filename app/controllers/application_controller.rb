require './config/environment'
require '.app/models/user'

class ApplicationController < Sinatra::Base

  configure do
    set :views, "app/views"
    enable :sessions
    set :session_secret, "password"
  end


  get '/' do
    erb :index
  end

  get "/signup" do
    erb :signup
  end

  post "/signup" do
    if params[:username].empty? || params[:password].empty?
      redirect '/failure'
    else
      User.create(params)
      redirect '/signin'
    end
  end


end
