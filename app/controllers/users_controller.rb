  class UsersController < ApplicationController
   before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
   #rajour de :destroy ci-dessous
   before_action :correct_user, only: [:edit, :update, :destroy]
   #before_action :admin_user, only: [:destroy]

  def index

      @users = User.paginate(page: params[:page])

  end


  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @email = @user.email
    
    if Clientcontact.where(email: @email).exists?
      @user.update_attribute(:clientcontact, true)
    elsif Bankcontact.where(email: @email).exists?
      @user.update_attribute(:bankcontact, true) 
    end

    
    if @user.save
  @user.send_activation_email
      flash[:info] = "Consultez vos emails pour activer votre compte."
      redirect_to root_url

    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

    def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Utilisateurs supprimés"
    redirect_to users_url
  end


  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)

      flash[:success] = "Votre profil a été mis à jour"
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

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :clientcontact)
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
