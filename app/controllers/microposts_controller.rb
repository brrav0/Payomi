class MicropostsController < ApplicationController

  before_action :logged_in_user, only: [:index, :new, :edit, :update]

def index
  @microposts = Micropost.paginate(page: params[:page], per_page: "5")
end

def new
  @micropost = Micropost.new
end

def edit
  @micropost = Micropost.find(params[:id])
end

def show
  @user = User.find(params[:id])
  @microposts = @user.restaurants.paginate(page: params[:page], per_page: "5")
end

def update
  @micropost = Micropost.find(params[:id])
  if @micropost.update(micropost_params)
    redirect_to microposts_path
  else
    render 'edit'
  end
end

def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:info]="Your place has been added"
      redirect_to root_url
    else
      render '/micropost/new'
    end
end

def like
  @micropost = Micropost.find(params[:format])
  @micropost.increment(:nboflikes, by = 1)
  redirect_to microposts_url
end

def destroy
  Micropost.find(params[:id]).destroy
  flash[:success]="The micropost has been deleted"
  redirect_to request.referrer || root_url
end

private

def micropost_params
  params.require(:micropost).permit(:content)
end

def logged_in_user
  unless logged_in?
    flash[:danger] = "Please log in."
    redirect_to login_url
  end
end



end
