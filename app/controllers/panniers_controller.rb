class PanniersController < ApplicationController

  get "/panniers" do
    if !logged_in?
      erb :'users/login', locals: {error_list: ["Login required."]}
    else
      @panniers = Pannier.where(user_id: current_user.id)
      erb :'panniers/index'
    end
  end

  post "/panniers" do
    @pannier = current_user.panniers.new(params[:pannier])
    if @pannier.valid?
      @pannier.save
      if !params[:item][:name].empty?
        if !params[:item][:weight].empty?
          @pannier.items << Item.create(params[:item])
          @pannier.save
          redirect to "/panniers/#{@pannier.id}"
        else
          erb :'panniers/new', locals: {error_list: ["Item must have a weight."]}
        end
      else
        @pannier.save
        redirect to "/panniers/#{@pannier.id}"
      end
    else
      local_error = {error_list: []}
      @pannier.errors.full_messages.each_with_index do |message|
        local_error[:error_list] << message
      end
      erb :'panniers/new', locals: local_error
    end
  end

  get "/panniers/new" do
    if !logged_in?
      erb :'login', locals: {error_list: ["Login required."]}
    else
      erb :'panniers/new'
    end
  end

  get "/panniers/:id/edit" do
    if !logged_in?
      erb :'login', locals: {error_list: ["Login required."]}
    else
      @pannier = Pannier.find(params[:id])
      if @pannier.user.id == current_user.id
        erb :'panniers/edit'
      else
        redirect "/panniers"
      end
    end
  end

  get "/panniers/:id" do
    if !logged_in?
      erb :'login', locals: {error_list: ["Login required."]}
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
    @pannier.assign_attributes(params[:pannier])
    if @pannier.valid?
      @pannier.save
      if !params[:item][:name].empty?
        if !params[:item][:weight].empty?
          @pannier.items << Item.create(params[:item])
          @pannier.save
          redirect to "/panniers/#{@pannier.id}"
        else
          erb :'panniers/edit', locals: {error_list: ["Item must have a weight."]}
        end
      else
        @pannier.save
        redirect to "/panniers/#{@pannier.id}"
      end
    else
      local_error = {error_list: []}
      @pannier.errors.full_messages.each_with_index do |message|
        local_error[:error_list] << message
      end
      erb :'panniers/edit', locals: local_error
    end
  end

  delete "/panniers/:id/delete" do
    if !logged_in?
      erb :'users/login', locals: {error_list: ["Login required."]}
    else
      @pannier = Pannier.find(params[:id])
      if @pannier.user_id == current_user.id
        @pannier.delete
        redirect "/panniers"
      else
        redirect "/panniers"
      end
    end
  end

end
