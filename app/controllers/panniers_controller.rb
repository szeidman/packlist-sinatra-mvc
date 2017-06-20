class PanniersController < ApplicationController

  get "/panniers" do
    @panniers = Pannier.all
    erb :'panniers/index'
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
    erb :'panniers/new'
  end

  get "/panniers/:id/edit" do
    @pannier = Pannier.find(params[:id])
    erb :'panniers/edit'
  end

  get "/panniers/:id" do
    @pannier = Pannier.find(params[:id])
    erb :'panniers/show'
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
