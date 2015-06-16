class BanksController < ApplicationController

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

end
