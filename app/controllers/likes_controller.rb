class LikesController < ApplicationController

def update_old
  restaurant = Restaurant.find(params[:format])
  @prior = restaurant.nboflikes
  @new ||= @prior + 1
  restaurant.update_attribute(:nboflikes, @new)
  redirect_to restaurants_url
end

def update
  restaurant = Restaurant.find(params[:format])

  @like = Like.new
  @liked = Like.where("user_id = ?", current_user)
  if @liked.where(restaurant_id: restaurant).exists?
  #flash[:info]="already liked!"
  redirect_to restaurants_url
  else
  @like.update_attribute(:restaurant, restaurant)
  @like.update_attribute(:user, current_user)
  @prior = restaurant.nboflikes
  @new ||= @prior + 1
  restaurant.update_attribute(:nboflikes, @new)
  redirect_to restaurants_url
  end
end

private

def like_params
  params.require(:like).permit(:user,:restaurant)
end

end
