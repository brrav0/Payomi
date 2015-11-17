class BankaccountsController < ApplicationController

def index

  @attachedfiles = AttachedFile.all
  
  puts "---------------------------------------------------------------------"
  puts "@attachedfiles: " + @attachedfiles.size.to_s
  
  @user = current_user
  #if user is logged and an auditor
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



  @bankaccounts1 = @bankaccounts.paginate(page: params[:page], per_page: 5)

  render 'bankaccounts/indexuser'
  #if user is a clientcontact
  elsif logged_in? && current_user.clientcontact?

  email = current_user.email
  #clientcontact = Client.find_by(email: email)
  #@id = clientcontact.client_id
  @client = Client.find_by(email: email)
  @id = @client.id
  #@client = clientcontact.client.name
  #if shared is not nil, then the confirmation is expecting to be signed
  @bankaccounts = Bankaccount.where("client_id = ?", @id).where.not(shared: nil) 
  render 'bankaccounts/indexclient'

  elsif logged_in? && current_user.bankcontact?

  email = current_user.email
  bankcontact = Bankcontact.find_by(email: email)
  @id = bankcontact.bank_id
  @bank = bankcontact.bank.name
  @bankaccounts = Bankaccount.where("bank_id = ?", @id).where.not(issued: nil) 
  @bankaccounts1 = @bankaccounts.paginate(page: params[:page], per_page: 5)
  render 'bankaccounts/indexbank'

  elsif logged_in? && current_user.admin?

  #@bankaccounts = Bankaccount.all
    if params[:search]
      @bankaccounts = Bankacccount.search(params[:search]).page([:page]).per_page(5)
    else
      @bankaccounts = Bankaccount.paginate(:page => params[:page], :per_page => 5)
    end
  render 'bankaccounts/indexadmin'

  else

	  render 'static_pages/home'

  end

end
 

def new
  # Must add the files here
  @attachedfiles = AttachedFile.all
  puts "@attachedfiles: " + @attachedfiles.size.to_s
  
  @bankaccount= Bankaccount.new
  
  @attachedfile = AttachedFile.new
end


def create

  client_id = params[:client_id]
  bank_id = params[:bank_id]
  @bankaccount = Bankaccount.new(bankaccount_params)
  if @bankaccount.save
    flash[:info]="Le compte bancaire a été sauvegardé"
    redirect_to root_url
  else
    render '/bankaccounts/new'
  end
end

def destroy
	Bankaccount.find(params[:id]).destroy
	flash[:success] = "Compte supprimé."
	redirect_to bankaccounts_url || root_url
	
	@attachedfile = AttachedFile.find(params[:id])
    @attachedfile.destroy
    redirect_to attached_files_path, notice:  "The attached file #{@attachedfile.name} has been deleted."
end

private

def bankaccount_params
	params.require(:bankaccount).permit(:number, :currency, :balance, :client_id, :bank_id)
end



end
