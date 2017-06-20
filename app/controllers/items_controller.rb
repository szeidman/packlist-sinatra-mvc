class ItemsController < ApplicationController

  get "/items" do
    if !logged_in?
      redirect '/login'
    else
      @items = Item.joins(:pannier).where(panniers: {user_id: current_user.id})
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
      redirect '/login'
    else
      erb :'items/new'
    end
  end

  get "/items/:id/edit" do
    if !logged_in?
      redirect '/login'
    else
      @item = Item.find(params[:id])
      erb :'items/edit'
    end
  end

  get "/items/:id" do
    if !logged_in?
      redirect '/login'
    else
      @item = Item.find(params[:id])
      erb :'items/show'
    end
  end

  patch "/items/:id" do
    @item = Item.find(params[:id])
    @item.update(params[:item])
    if !params[:pannier][:name].empty?
      @item.pannier = Pannier.create(params[:pannier])
    end
    @item.save
    redirect to "/items/#{@item.id}"
  end



end
