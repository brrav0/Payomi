class BankaccountsController < ApplicationController

def index

  @user = current_user
  if logged_in? && !current_user.admin? && !current_user.bankcontact? && !current_user.clientcontact?

#  for real application before deletion
#  @bankaccounts = current_user.bankaccounts
# for deletion
# clients is an array - you cannot call a method on an array - you build another bankaccounts array by iterating through client  
  clients = current_user.clients
  @bankaccounts = Array.new
  clients.each do |client|
    @bankaccounts +=client.bankaccounts
  end

  render 'bankaccounts/indexuser'

  elsif logged_in? && current_user.clientcontact?

  email = current_user.email
  clientcontact = Clientcontact.find_by(email: email)
  @id = clientcontact.client_id
  @client = clientcontact.client.name
  @bankaccounts = Bankaccount.where("client_id = ?", @id).where.not(shared: nil) 
  render 'bankaccounts/indexclient'

  elsif logged_in? && current_user.bankcontact?

  email = current_user.email
  bankcontact = Bankcontact.find_by(email: email)
  @id = bankcontact.bank_id
  @bank = bankcontact.bank.name
  @bankaccounts = Bankaccount.where("bank_id = ?", @id).where.not(issued: nil)
  render 'bankaccounts/indexbank'

  elsif logged_in? && current_user.admin?

  @bankaccounts = Bankaccount.all
  render 'bankaccounts/indexadmin'

  else

  render 'static_pages/home'

  end

end
 

def new
  @bankaccount= Bankaccount.new
end


def create

  client_id = params[:client_id]
  bank_id = params[:bank_id]
  @bankaccount = Bankaccount.new(bankaccount_params)
  if @bankaccount.save
    flash[:info]="Le compte bancaire a été sauvegardé"
  else
    render '/bankaccount/new'
  end
end

def destroy
  Bankaccount.find(params[:id]).destroy
flash[:success] = "Compte supprimé."
redirect_to bankaccounts_url || root_url
end

private

def bankaccount_params
  params.require(:bankaccount).permit(:number, :currency, :balance, :client_id, :bank_id)
end

end
