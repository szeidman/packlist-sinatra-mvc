class UsersController < ApplicationController

  get "/signup" do
    erb :'users/create_user'
  end

  post "/signup" do
    if params[:username] == "" || params[:password] == ""
      redirect "/signup"
    else
      User.create(params)
      redirect "/signin"
    end
  end

  get 'users/:id' do
    @user = User.find_by(id: params[:id])
    erb :"users/show"
  end

  get "/signin" do
    if !logged_in?
      erb :'users/signin'
    else
      redirect '/panniers'
    end
  end

  post "/signin" do
    user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
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
