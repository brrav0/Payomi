class BanksController < ApplicationController
  before_action :admin_user
  before_action :logged_in_user
def index
  @banks = Bank.all
end

def new
  @bank = Bank.new
end

def show
  @bank = Bank.find(params[:id])
end

def create
  @bank = Bank.new(bank_params)
    if @bank.save
      flash[:info]="Banque ajoutée"
      redirect_to root_url
    else
      render '/banks/new'
    end  
end

def destroy
  Bank.find(params[:id]).destroy
  flash[:success]="Banque supprimée."
  redirect_to request.referrer || root_url
end

private

def bank_params
  params.require(:bank).permit(:name, :number_and_street, :zip_code, :city)
end

def logged_in_user
  unless logged_in?
    store_location
    flash[:danger] = "Veuilez vous connecter."
    redirect_to login_url
  end
end

def admin_user
  redirect_to(root_url) unless current_user.admin?
end

end
