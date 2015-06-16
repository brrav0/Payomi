class ClientsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: [:destroy]


  def index
    @clients = current_user.clients
  end


  def new
    @client = current_user.clients.build 
  end

  def show
    @client = current_user.clients.find(params[:id])
  end

  def create
   @client = current_user.clients.build(client_params)
    if @client.save
      flash[:success] = "Le client a été créé."
      redirect_to root_url
    else
      render '/clients/new'
    end
  end

  def destroy
    @client.destroy
  flash[:success] = "Client supprimé."
  redirect_to request.referrer || root_url
  end

  private

  def client_params
    params.require(:client).permit(:name, :number_and_street, :zip_code, :city)
  end

  def correct_user
    @client = current_user.clients.find_by(id: params[:id])
    redirect_to root_url if @client.nil?
  end

end
