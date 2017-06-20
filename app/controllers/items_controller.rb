class ItemsController < ApplicationController

  get "/items" do
    if !logged_in?
      redirect '/signin'
    else
      @items = Item.all
      erb :'items/index'
    end
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
    if !logged_in?
      redirect '/signin'
    else
      erb :'items/new'
    end
  end

  get "/items/:id/edit" do
    if !logged_in?
      redirect '/signin'
    else
      @item = Item.find(params[:id])
      erb :'items/edit'
    end
  end

  get "/items/:id" do
    if !logged_in?
      redirect '/signin'
    else
      @item = Item.find(params[:id])
      erb :'items/show'
    end
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
