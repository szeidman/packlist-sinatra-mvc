class UsersController < ApplicationController

  get "/signup" do
    if !logged_in?
      erb :'users/create_user'
    else
      redirect '/panniers'
    end
  end

  post "/signup" do
    if params[:username] == "" || params[:password] == ""
      redirect "/signup"
    else
      @user = User.create(params)
      redirect '/login'
    end
  end

  get 'users/:id' do
    @user = User.find_by(id: params[:id])
    erb :"users/show"
  end

  get "/login" do
    if !logged_in?
      erb :'users/login'
    else
      redirect '/panniers'
    end
  end

  post "/login" do
    user = User.find_by(username: params[:username])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect "/panniers"
      else
        redirect "/signup"
      end
  end

  get "/logout" do
    session.clear
    redirect "/"
  end

end
