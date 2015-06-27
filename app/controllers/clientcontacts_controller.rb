class ClientcontactsController < ApplicationController

def index
  if current_user.admin?
    @clientcontacts = Clientcontact.all
  else
    clients = current_user.clients
    @clientcontacts = Array.new
    clients.each do |client|  
    @clientcontacts += client.clientcontacts
    end
  end
end

def new
  @clientcontact = Clientcontact.new
end

def create
  client = Client.find(params[:clientcontact][:client_id])
  @clientcontact = client.clientcontacts.build(clientcontact_params)
  if @clientcontact.save
    flash[:info]="Votre contact client a été ajouté"
    redirect_to root_url
  else
    render '/clientcontact/new'
  end
end

def destroy
  Clientcontact.find(params[:id]).destroy
flash[:success] = "Contact client supprimé."
redirect_to request.referrer || root_url
end

private

def clientcontact_params
  params.require(:clientcontact).permit(:first_name, :last_name, :email)
end



end
