class AccountingfirmsController < ApplicationController

def index
  @accountingfirm = Accountingfirm.all
end

def new
  @accountingfirm = Accountingfirm.new
end

def show
  @accountingfirm = Accountingfirm.find(params[:id])
end

def create
  @accountingfirm = Accountingfirm.new(accountingfirm_params)
    if @accountingfirm.save
      flash[:info]="Le cabinet d'audit a été ajouté"
      redirect_to root_url
    else
      render '/acountingfirms/new'
    end
end

def destroy
  Accountingfirm.find(params[:id]).destroy
  flash[:success]="Le cabinet d'audit a été supprimé."
  redirect_to request.referrer || root_url
end

private

def accountingfirm_params
  params.require(:accountingfirm).permit(:name, :number_and_street, :zip_code, :city)
end


end
