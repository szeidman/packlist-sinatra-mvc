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
      @user.save!
      redirect '/login'
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
        erb :'users/login', locals: {error_list: ["Invalid credentials. Please try again or create account below."]}
      end
  end

  get "/logout" do
    session.clear
    redirect "/"
  end

end
