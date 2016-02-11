class RestaurantsController < ApplicationController

before_action :logged_in_user, only: [:index, :new, :edit, :update]

def index
  @restaurants = Restaurant.all
end

def new
  @restaurant = Restaurant.new
end

def edit
  @restaurant = Restaurant.find(params[:id])
end

def show
  @restaurant = Restaurant.find(params[:id])
end

def update
  @restaurant = Restaurant.find(params[:id])
  if @restaurant.update(restaurant_params)
    redirect_to restaurants_path
  else
    render 'edit'
  end
end

def create
    @restaurant = current_user.restaurants.build(restaurant_params)
    if @restaurant.save
      flash[:info]="Your place has been added"
      redirect_to restaurants_url
    else
      render '/restaurant/new'
    end
end

def like
  @restaurant = Restaurant.find(params[:format])
  @restaurant.increment(:nboflikes, by = 1)
  redirect_to restaurants_url
end

def destroy
  Restaurant.find(params[:id]).destroy
  flash[:success]="The restaurant has been deleted"
  redirect_to request.referrer || root_url
end

private

def restaurant_params
  params.require(:restaurant).permit(:name, :city, :likes)
end

def logged_in_user
  unless logged_in?
    flash[:danger] = "Please log in."
    redirect_to login_url
  end
end

end
