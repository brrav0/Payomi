class ConfirmationsController < ApplicationController


def index


  @user = current_user
  if logged_in? && !current_user.admin? && !current_user.bankcontact? && !current_user.clientcontact?

# clients is an array - you cannot call a method on an array - you build another confirmations array by iterating through client  
   @confirmations = @user.confirmations
   @banks = Bank.all
   @clients = Client.all
    render 'confirmations/indexuser'

  elsif logged_in? && current_user.admin?

  #@confirmation = Confirmations.all
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
  # @attachedRequestFiles = AttachedFile.where("bankaccount_id = ? AND is_audit = ?", params[:id], true)
  # @confirmations = Confirmation.where("bank_id = ?", @id).where.not(status: "Terminée")
  @confirmations = Confirmation.where("bank_id = ?", @id)
  @confirmations_pagination = @confirmations.paginate(:page => 1, per_page: 5)
  render 'confirmations/indexbank'


  else

  render 'static_pages/home'

  end

end

# --- New Confirmation ---
# Handle here the access attached file
def new

  @confirmation= Confirmation.new
    
end
  

def create
  @user = current_user
  client_id = params[:client_id]
  bank_id = params[:bank_id]
  
  @confirmation = @user.confirmations.create(confirmation_params)
  id1 = @confirmation.id.to_s
  id2 = rand(1000..2000).to_s
  @id3 = "C"+id1+"0V0"+id2+"Y15"
  @confirmation.update_attribute(:reference, @id3) 
 
  redirect_to root_url
 
end


# --- CHECK BY AUDITOR --------------------------------------------------------------
def check_by_auditor
  @confirmation = Confirmation.find(params[:id])
  @client = @confirmation.client
  @clientcontact = Clientcontact.find_by(client: @client)
  @bank = Bank.find(@confirmation.bank_id)
  @bankcontact = Bankcontact.find_by(bank: @bank)
  @user = current_user
  @cac = @client.user
  @id = @confirmation.id
  

  render '/confirmations/check_by_auditor/'
end


# --- CHECK BY BANK --------------------------------------------------------------
  def check_by_bank
    @confirmation = Confirmation.find(params[:id])
    @client = @confirmation.client
    @clientcontact = Clientcontact.find_by(client: @client)
    @bank = Bank.find(@confirmation.bank_id)
    @bankcontact = Bankcontact.find_by(bank: @bank)
    @user = current_user
    @cac = @client.user
    @id = @confirmation.id
    @status = @confirmation.status
  end
  
def answer
  @confirmation = Confirmation.find(params[:id]) 
    if @confirmation.save and @confirmation.update_attribute(:status, "Terminée")
      flash[:info]="Votre réponse a été communiquée au commissaire aux comptes."		
      redirect_to confirmations_url
    else
      flash[:info]="Une erreur est survenue. Veuillez nous contacter."
      redirect_to confirmations_url
    end 
end

def update
  @confirmation = Confirmation.find(params[:id]) 
    #if @confirmation.update_attribute(:file_answer, params[:file_answer]) and @confirmation.save and @confirmation.update(confirmation_params)
    if @confirmation.update(confirmation_params) and @confirmation.update_attribute(:status, "Terminée") and @confirmation.update_attribute(:answered_at, Time.now.to_formatted_s(:short))
      flash[:info]="Votre réponse a été communiquée au commissaire aux comptes."		
      redirect_to confirmations_url
    else
      flash[:info]="Une erreur est survenue. Veuillez nous contacter."
      redirect_to confirmations_url
    end 
end

def destroy
  #have to change the line below down the road by modifying the way data are structured
  @confirmation = Confirmation.find(params[:id])
  @confirmation.destroy
  flash[:success] = "Confirmation supprimée."
  redirect_to root_url   
end


private

def confirmation_params
  params.require(:confirmation).permit(:client_id, :bank_id, :status, :reference, :file,:file_answer)
end

end
