class ItemsController < ApplicationController

  get "/items" do
    @items = Item.all
    erb :'items/index'
  end

  post "/items" do
    @item = Item.create(params[:item])
    if !params[:pannier][:name].empty?
      @item.pannier = Pannier.create(params[:pannier])
    end
    @item.save
    redirect to "/items"
  end

  get "/items/new" do
    erb :'items/new'
  end

  get "/items/:id/edit" do
    @item = Item.find(params[:id])
    erb :'items/edit'
  end

  get "/items/:id" do
    @item = Item.find(params[:id])
    erb :'items/show'
  end

  post "/items/:id" do
    @item = Item.find(params[:id])
    @item.update(params[:item])
    if !params[:pannier][:name].empty?
      @items.pannier = Pannier.create(params[:item])
    end
    @item.save
    redirect to "/items/#{@item.id}"
  end



end
