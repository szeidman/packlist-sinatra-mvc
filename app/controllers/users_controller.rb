class UsersController < ApplicationController

  get "/signup" do
    if !logged_in?
      erb :'users/create_user'
    else
      redirect '/panniers'
    end
  end

  post "/signup" do
    @user = User.new(params)
    if @user.valid?
      @user.save
      redirect '/login', locals: {message: "Thanks! Please sign in with your new credentials."}
    else
      local_error = {error_list: []}
      @user.errors.full_messages.each_with_index do |message|
        local_error[:error_list] << message
      end
      erb :'users/create_user', locals: local_error
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
        erb :'users/create_user', locals: {error_list: ["Invalid credentials. Please sign up to create an account."]}
      end
  end

  get "/logout" do
    session.clear
    redirect "/"
  end

  helpers do
    def user_error
      local_error = {error_list: []}
      @user.errors.full_messages.each_with_index do |message|
        local_error[:error_list] << message
      end
      erb :'users/create_user', locals: local_error
    end

  end

end
