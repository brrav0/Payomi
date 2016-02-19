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
  flash[:info] = "test"
end

def destroy
  @user = User.find(params[:id])
  @restaurant = Restaurant.find(params[:id])
end

end
