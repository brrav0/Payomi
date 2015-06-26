class BankcontactsController < ApplicationController
  before_action :admin_user
  before_action :logged_in_user


def index
  @bankcontacts = Bankcontact.all
end

def new
  @bankcontact = Bankcontact.new
end

def create

  bank_id = params[:bank_id]
  @bankcontact = Bankcontact.new(bankcontact_params)
 # bank = Bank.find(params[:bankcontact][:bank_id])
 # @bankcontact = bank.bankcontacts.build(bankcontact_params)
  if @bankcontact.save
    flash[:info]="Le contact de la banque a bien été ajouté"
    redirect_to root_url
  else
    render '/bankcontact/new'
  end
end

def destroy
  Bankcontact.find(params[:id]).destroy
  flash[:success] = "Contact banque supprimé."
  redirect_to request.referrer || root_url
end

private

def bankcontact_params
# params.require(:bankcontact).permit(:first_name, :last_name, :email)
  params.require(:bankcontact).permit(:first_name, :last_name, :email, :bank_id)
end

def logged_in_user
  unless logged_in?
    store_location
    flash[:danger] = "Veuillez vous connecter."
    redirect_to login_url
  end
end

def admin_user
  redirect_to(root_url) unless current_user.admin?
end


end
