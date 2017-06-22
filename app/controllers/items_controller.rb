class ItemsController < ApplicationController

  get "/items" do
    if !logged_in?
      redirect '/login?error=Please log in'
    else
      @items = current_user.items.all
      erb :'items/index'
    end
  end

  post "/items" do
    @item = Item.create(params[:item])
    if !params[:pannier][:name].empty?
      @item.pannier = current_user.panniers.create(params[:pannier])
    end
    if @item.valid?
      @item.save!
      redirect to "/items"
    else
      erb :'items/new', locals: {er_mes: "ERROR:", name_message: "#{@item.errors.messages[:name].first}", weight_message:"#{@item.errors.messages[:weight].first}", pannier_id_message:"#{@item.errors.messages[:pannier_id].first}"}
    end
  end

  get "/items/new" do
    if !logged_in?
      redirect '/login?error=Please log in'
    else
      erb :'items/new'
    end
  end

  get "/items/:id/edit" do
    if !logged_in?
      redirect '/login?error=Please log in'
    else
      @item = Item.find(params[:id])
      if @item.pannier.user_id == current_user.id
        erb :'items/edit'
      else
        redirect to "/items"
      end
    end
  end

  get "/items/:id" do
    if !logged_in?
      redirect '/login?error=Please log in'
    else
      @item = Item.find(params[:id])
      if @item.pannier.user_id == current_user.id
        erb :'items/show'
      else
        redirect to "/items?error=Not a valid item"
      end
    end
  end

  patch "/items/:id" do
    @item = Item.find(params[:id])
    @item.assign_attributes(params[:item])
    if @item.valid?
      if !params[:pannier][:name].empty?
        @item.pannier = current_user.panniers.create(params[:pannier])
      end
      @item.update!
      redirect to "/items/#{@item.id}"
    else
      erb :'items/new', locals: {er_mes: "ERROR:", name_message: "#{@item.errors.messages[:name].first}", weight_message:"#{@item.errors.messages[:weight].first}", pannier_id_message:"#{@item.errors.messages[:pannier_id].first}"}
    end
  end

  delete "/items/:id/delete" do
    if !logged_in?
      redirect '/login'
    else
      @item = Item.find(params[:id])
      if @item.pannier.user_id == current_user.id
        @item.delete
        redirect "/items"
      else
        redirect "/items"
      end
    end
  end

end
