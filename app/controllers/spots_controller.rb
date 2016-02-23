class SpotsController < ApplicationController

  before_action :logged_in_user, only: [:index, :new, :edit, :update]

def index
  @spots = Spot.paginate(page: params[:page], per_page: "5")
end

def new
  @spot = Spot.new
end

def edit
  @spot = Spot.find(params[:id])
end

def show
  @user = User.find(params[:id])
  @spots = @user.spots.paginate(page: params[:page], per_page: "5")
end

def update
  @post = Spot.find(params[:id])
  if @spot.update(spot_params)
    redirect_to posts_path
  else
    render 'edit'
  end
end

def create
    @spot = Spot.new(spot_params)

    @micropost = @spot.microposts.build(micropost_params)
    @micropost.user = current_user

    @recommendation = Recommendation.new
    @micropost.save

    if @spot.save
      flash[:info]="Your place has been added"
      @recommendation.update_attribute(:restaurant_id, @spot.id)
      @recommendation.update_attribute(:user_id, current_user.id)
      @recommendation.save
      redirect_to root_url
    else
      render '/spot/new'
    end
end

def destroy
  Spot.find(params[:id]).destroy
  flash[:success]="The spot has been deleted"
  redirect_to request.referrer || root_url
end

private

def spot_params
  params.require(:spot).permit(:name, :city)
end

def micropost_params
  params.require(:micropost).permit(:content, :user, :spot)
end

def recommendation_params
  params.require(:recommendation).permit(:user, :spot)
end

def logged_in_user
  unless logged_in?
    flash[:danger] = "Please log in."
    redirect_to login_url
  end
end



end
