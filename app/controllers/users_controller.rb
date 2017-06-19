class UsersController < ApplicationController

  get "/signup" do
    erb :signup
  end

  post "/signup" do
    if params[:username].empty? || params[:password].empty?
      redirect "/users/failure"
    else
      User.create(params)
      redirect "/users/signin"
    end
  end

  get "/account" do
    @user = User.find(session[user_id])
    erb :"users/account"
  end

  get "/signin" do
    user = User.find_by(username: params[:username])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect "/users/account"
      else
        redirect "/users/failure"
      end
  end

  get "/success" do
    if logged_in?
      erb :success
    else
      redirect "/users/signin"
    end
  end

  get "/failure" do
    erb :"users/failure"
  end

  get "/logout" do
    session.clear
    redirect "/"
  end

end
