class RecommendationsController < ApplicationController

def create
  @recommendation = Recommendation.new
  @recommendation.user_id = params[:user_id]
  @recommendation.spot_id = params[:spot_id]
  @recommendation.save


  flash[:info] = "This place has been re-recommended!"
  redirect_to root_url
end

def destroy
  flash[:info] = "Unrecommended!"
  recommendation_to_destroy = Recommendation.where("user_id = ?", params[:user_id]).where("spot_id = ?", params[:spot_id])
  recommendation_to_destroy.each do |r|
    r.destroy
  end
  redirect_to root_url
end

end
