  class UsersController < ApplicationController
   before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :following, :followers]
   before_filter :correct_user, only: [:edit, :update]
   before_action :admin_user, only: [:destroy]

  def index
      @users = User.paginate(page: params[:page], per_page: "5")
  end


  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end

  def showme
    @user = User.find(params[:format])
    @microposts = @user.microposts.paginate(page: params[:page])
    @saved_items = Save.where("user_id = ?", current_user.id)
    @array_of_saved_spots = []
    @saved_items.each do |items|
      @array_of_saved_spots.push(Spot.find(items.spot_id))
    end
  end

  def new
    @user = User.new
  end

  def new_bankuser
    @user = User.new
    render 'new_bankuser'
  end

  def create
    @user = User.new(user_params)
    @email = @user.email
    @user.update_attribute(:activated, true)
    if @user.save
  #@user.send_activation_email
      #flash[:info] = "Check your emails to activate your account."
      flash[:info] = "Congratulation! You are signed up."
      #temporary as no activation necessary
      log_in @user
      #end
      redirect_to home_url

    else
      render 'new'
    end
  end

  def create_bankuser
    @user = User.new(user_params)
    @user.update_attribute(:bankcontact, true)
  end

  def edit
    @user = User.find(params[:id])
  end

    def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Users deleted"
    redirect_to users_url
  end


  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)

      flash[:success] = "Your profile has been updated."
      redirect_to @user

      # Handle a successful update.
    else
      render 'edit'
    end
  end

  def bankcontactupdate
    @user = User.find(params[:id])
    if @user.update_attribute(:bankcontact, true)
      flash[:info]="le user #{params[:id]} est désormais un contact banque."
      redirect_to users_url
    end
  end

  def clientcontactupdate
    @user = User.find(params[:id])
    if @user.update_attribute(:clientcontact, true)
      flash[:info]="le user #{params[:id]} est désormais un contact client."
      redirect_to users_url
    end
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private

    def user_params
      #params.require(:user).permit(:name, :email,:password,:password_confirmation,:clientcontact,:bankcontact,:role)
      params.require(:user).permit(:name, :email,:password,:password_confirmation)
    end


   # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Veuilez vous connecter."
        redirect_to login_url
      end
    end

      # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
        redirect_to(root_url) unless current_user?(@user)
    end

      # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end
