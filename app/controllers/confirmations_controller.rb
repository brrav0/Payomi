class ConfirmationsController < ApplicationController

def index

  @user = current_user
  if logged_in? && !current_user.admin? && !current_user.bankcontact? && !current_user.clientcontact?

# clients is an array - you cannot call a method on an array - you build another bankaccounts array by iterating through client  
   @confirmations = @user.confirmations
   @banks = Bank.all
   @clients = Client.all
    render 'confirmations/indexuser'

  elsif logged_in? && current_user.admin?

  #@bankaccounts = Bankaccount.all
    if params[:search]
      @confirmations = Confirmation.search(params[:search]).page([:page]).per_page(5)
    else
      @confirmations = Confirmation.paginate(:page => params[:page], :per_page => 5)
    end
  render 'confirmations/indexadmin'

  elsif logged_in? && current_user.bankcontact?

  email = current_user.email
  bankcontact = Bankcontact.find_by(email: email)
  @id = bankcontact.bank_id
  @banks = Bank.all
  @clients = Client.all
  @bank = bankcontact.bank.name
  @confirmations = Confirmation.where("bank_id = ?", @id).where.not(status: "Terminée")
  render 'confirmations/indexbank'


  else

  render 'static_pages/home'

  end

end

def new
  @confirmation = Confirmation.new
end

def create
  @user = current_user
  client_id = params[:client_id]
  bank_id = params[:bank_id]
  #confirmations = Confirmation.new(confirmation_params)
  @confirmation = @user.confirmations.create(confirmation_params)
  id1 = @confirmation.id.to_s
  id2 = rand(1000..2000).to_s
  @id3 = "C"+id1+"0V0"+id2+"Y15"
  @confirmation.update_attribute(:reference, @id3) 
  if @confirmation.save
    flash[:info]="La circularisation a été sauvegardée"
    redirect_to confirmations_url
  else
    render '/confirmations/new'
  end
end

def check_by_auditor
  @confirmation = Confirmation.find(params[:id])
  @client = @confirmation.client
  @clientcontact = Clientcontact.find_by(client: @client)
  @bankcontact = Bankcontact.find_by(bank: @bank)
  @user = current_user
  @cac = @client.user
  @id = @confirmation.id

  render '/confirmations/check_by_auditor/'
end

def check_by_bank
  @confirmation = Confirmation.find(params[:id])
  @client = @confirmation.client
  @clientcontact = Clientcontact.find_by(client: @client)
  @bankcontact = Bankcontact.find_by(bank: @bank)
  @user = current_user
  @cac = @client.user
  @id = @confirmation.id

  render '/confirmations/check_by_bank/'
end

def answer
  @confirmation = Confirmation.find(params[:id])
  if @confirmation.update_attribute(:status, "Terminée")
    flash[:info]="Votre réponse a été communiquée au commissaire aux comptes."
    redirect_to confirmations_url
  else
    flash[:info]="Une erreur est survenue. Veuillez nous contacter."
    redirect_to confirmations_url
  end
end


private

def confirmation_params
  params.require(:confirmation).permit(:client_id, :bank_id, :status)
end


end
