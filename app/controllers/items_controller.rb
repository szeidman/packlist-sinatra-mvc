class ItemsController < ApplicationController

  get "/items" do
    if !logged_in?
      erb :'users/login', locals: {error_list: ["Login required."]}
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
      local_error = {error_list: []}
      @item.errors.full_messages.each_with_index do |message|
        local_error[:error_list] << message
      end
      erb :'items/new', locals: local_error
    end
  end

  get "/items/new" do
    if !logged_in?
      erb :'users/login', locals: {error_list: ["Login required."]}
    else
      erb :'items/new'
    end
  end

  get "/items/:id/edit" do
    if !logged_in?
      erb :'users/login', locals: {error_list: ["Login required."]}
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
      erb :'users/login', locals: {error_list: ["Login required."]}
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
    if !params[:pannier][:name].empty?
      @item.pannier = current_user.panniers.create(params[:pannier])
    end
    if @item.valid?
      @item.save
      redirect to "/items/#{@item.id}"
    else
      local_error = {error_list: []}
      @item.errors.full_messages.each_with_index do |message|
        local_error[:error_list] << message
      end
      erb :'items/edit', locals: local_error
    end
  end

  delete "/items/:id/delete" do
    if !logged_in?
      erb :'users/login', locals: {error_list: ["Login required."]}
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
