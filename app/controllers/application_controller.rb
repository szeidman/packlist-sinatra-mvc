require './config/environment'

class ApplicationController < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views")}
  register Sinatra::Twitter::Bootstrap::Assets

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
      redirect '/login'
    end
  end


end
