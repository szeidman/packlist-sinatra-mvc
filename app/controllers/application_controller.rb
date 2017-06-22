require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, "app/views"
    enable :sessions
    set :session_secret, "packlist_secret"
  #  set :show_exceptions, false
  end

  get '/' do
    if !logged_in?
      erb :index
    else
      redirect 'panniers'
    end
  end

  helpers do

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end

  end

end
