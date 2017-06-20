class PanniersController < ApplicationController

  get "/panniers" do
    if !logged_in?
      redirect '/signin'
    else
      @panniers = Pannier.all
      erb :'panniers/index'
    end
  end

  post "/panniers" do
    @pannier = Pannier.create(params[:pannier])
    if !params[:item][:name].empty?
      @pannier.items << Item.create(params[:item])
    end
    @pannier.save
    redirect to "/panniers"
  end

  get "/panniers/new" do
    if !logged_in?
      redirect '/signin'
    else
      erb :'panniers/new'
    end
  end

  get "/panniers/:id/edit" do
    if !logged_in?
      redirect '/signin'
    else
      @pannier = Pannier.find(params[:id])
      erb :'panniers/edit'
    end
  end

  get "/panniers/:id" do
    if !logged_in?
      redirect '/signin'
    else
      @pannier = Pannier.find(params[:id])
      erb :'panniers/show'
    end
  end

  post "/panniers/:id" do
    @pannier = Pannier.find(params[:id])
    @pannier.update(params[:pannier])
    if !params[:item][:name].empty?
      @pannier.items << Item.create(params[:item])
    end
    @pannier.save
    redirect to "/panniers/#{@pannier.id}"
  end



end
