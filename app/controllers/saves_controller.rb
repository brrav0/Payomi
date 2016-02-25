class SavesController < ApplicationController

before_action :logged_in_user

def new
  @save = Save.new 
end

def index
  #need to change this to something better as it is not really an index action
  @restaurant = Restaurant.where("name = ?",params[:restaurant])
  flash[:info] = "@#{@restaurant.name}"
  redirect_to root_url
end

def create
  @save = Save.new
  #@save = current_user.saves.build
  @save.user_id = params[:user_id]
  @save.spot_id = params[:spot_id]
  @save.save
  flash[:info] = "The spot has been added to your saved list!"
  redirect_to root_url
end

def destroy
  flash[:info] = "Unsaved!"
  save_to_destroy = Save.where("user_id = ?", params[:user_id]).where("spot_id = ?", params[:spot_id])
  save_to_destroy.each do |s|
    s.destroy
  end
  #Save.find(params[:id]).destroy
  redirect_to root_url
end

end
