class PanniersController < ApplicationController

  get "/panniers" do
    if !logged_in?
      redirect '/login'
    else
      @panniers = Pannier.where(user_id: current_user.id)
      erb :'panniers/index'
    end
  end

  post "/panniers" do
    @pannier = Pannier.create(params[:pannier])
    if !params[:item][:name].empty?
      @pannier.items << Item.create(params[:item])
    end
    @pannier.user_id = current_user.id
    @pannier.save
    redirect to "/panniers"
  end

  get "/panniers/new" do
    if !logged_in?
      redirect '/login'
    else
      erb :'panniers/new'
    end
  end

  get "/panniers/:id/edit" do
    if !logged_in?
      redirect '/login'
    else
      @pannier = Pannier.find(params[:id])
      if @pannier.user_id == current_user.id
        erb :'panniers/edit'
      else
        redirect "/panniers"
      end
    end
  end

  get "/panniers/:id" do
    if !logged_in?
      redirect '/login'
    else
      @pannier = Pannier.find(params[:id])
      if @pannier.user_id == current_user.id
        erb :'panniers/show'
      else
        redirect "/panniers"
      end
    end
  end

  patch "/panniers/:id" do
    @pannier = Pannier.find(params[:id])
    @pannier.update(params[:pannier])
    if !params[:item][:name].empty?
      @pannier.items << Item.create(params[:item])
    end
    @pannier.save
    redirect to "/panniers/#{@pannier.id}"
  end

end
