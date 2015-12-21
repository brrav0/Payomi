class BankaccountsController < ApplicationController

def index

  # When we arrive first on index
  # Fresh start we need an empty attached file
  
  @attachedfiles = []
  puts '@attachedfiles: ' + @attachedfiles.to_s
  
  
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
  @confirmations = Confirmation.where("confirmation_id = ?", @id).where.not(status: "Terminée") 
  render 'confirmations/indexbank'
  

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
 
#--- New File ---
def new

  
  @bankaccount= Bankaccount.new
  puts "@bankaccount: " + @bankaccount.to_s
  
  @attachedfile = AttachedFile.new
  
  
  # --- Retrieve last attached file ---
  # The big question is where are we come from ? If we have just attached a new file
  # Then we need to retrieve all our attached files. If not, then we are freshly new
  # Remember: session is unsafe, you must not store any sensitive data here
  
  # Retrieve the attached file from session
  # If this file exists, we need to attached it
  if !session[:last_attachedfile].nil?
    attachedfileSaved = YAML.load(session[:last_attachedfile])
    
    
    if !session[:involved_attachedfiles].nil?
      # Retrieve here all session attached files
      @attachedfiles = YAML.load(session[:involved_attachedfiles])
    
      @attachedfiles.push(attachedfileSaved)
      # Save in session
      session[:involved_attachedfiles] = @attachedfiles.to_yaml
      else
        @attachedfiles = []
    end
    
    # After that we flush the data
    # When we arrive first on index
    # Fresh start we need an empty attached file
    session.delete(:last_attachedfile)
    
    puts "attachedfileSaved: " + attachedfileSaved.to_s
    
    
    
  else
    # We are freshly new
    puts "attachedfileSaved is nil"
    session.delete(:last_attachedfile)
    session.delete(:involved_attachedfiles)
    
    # Must add the files here
    @attachedfiles = []
    
    # Save in session
    session[:involved_attachedfiles] = @attachedfiles.to_yaml
    
    
  end
  
end


def create

  client_id = params[:client_id]
  bank_id = params[:bank_id]
  @bankaccount = Bankaccount.new(bankaccount_params)
  
  # --- We need to update all attached file now ---
  if !session[:involved_attachedfiles].nil?
	  # Retrieve here all session attached files
	  @attachedfiles = YAML.load(session[:involved_attachedfiles])
  	  
  	  puts 'Size @attachedfiles: ' + @attachedfiles.size.to_s
  	  
  	  if @attachedfiles.size > 0
  	  	  @bankaccount.attached_files << @attachedfiles
		  if @bankaccount.save
			flash[:info]="Le compte bancaire a été sauvegardé"
			session.delete(:last_attachedfile)
			session.delete(:involved_attachedfiles)
		
		
			redirect_to root_url
		  else
			render '/bankaccounts/new'
		  end
  	  else
		todo_when_attachedfile_is_empty
  	  end
  
  else
	todo_when_attachedfile_is_empty
  end
  

end

def todo_when_attachedfile_is_empty
    # This point has not yet been tested
  	flash[:danger]="Veuillez attacher au moins un scan à la demande"
  	redirect_to '/bankaccounts/new'
end

def edit
  @bankaccount = Bankaccount.find(params[:id])
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
