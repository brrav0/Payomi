class UseractionsController < ApplicationController

def share
  @bankaccount = Bankaccount.find(params[:id])
  if @bankaccount.update_attribute(:shared, Time.new)
    flash[:info]="La circularisation a été envoyée au signataire autorisé pour signature."
    redirect_to bankaccounts_url
  else
    flash[:info]="Une erreur est survenue. Veuillez nous contacter."
    redirect_to bankaccounts_url
  end
end

def sign
  @bankaccount = Bankaccount.find(params[:id])
  if @bankaccount.update_attribute(:signed, Time.new)
    flash[:info]="La circularisation est signée. Votre commissaire aux comptes peut désormais l'acheminer à votre banque."
    redirect_to bankaccounts_url
  else
    flash[:info]="Une erreur est survenue. Veuillez nous contacter."
    redirect_to bankaccounts_url
  end
end

def issue
  @bankaccount = Bankaccount.find(params[:id])
  if @bankaccount.update_attribute(:issued, Time.new)
    flash[:info]="La circularisation a été envoyée."
    redirect_to bankaccounts_url
  else
    flash[:info]="Une erreur est survenue. Veuillez nous contacter."
    redirect_to bankaccounts_url
  end
end

def check
  @bankaccount = Bankaccount.find(params[:id])
  @client = @bankaccount.client
  @bank = @bankaccount.bank
  @clientcontact = Clientcontact.find_by(client: @client)
  @bankcontact = Bankcontact.find_by(bank: @bank)
  @user = current_user
  @cac = @client.user
  @id = @bankaccount.id
  
  render '/bankaccounts/check/'
end

def answer
  @bankaccount = Bankaccount.find(params[:id])
  if @bankaccount.update_attributes(bankaccount_params) && @bankaccount.update_attribute(:answered, Time.new)
    flash[:info]="Votre réponse a été communiquée au commissaire aux comptes."
    redirect_to bankaccounts_url
  else
    flash[:info]="Une erreur est survenue. Veuillez nous contacter."
    redirect_to bankaccounts_url
  end
end

def answer_with_comments
  @bankaccount = Bankaccount.find(params[:id])

  if params[:conf]

    if @bankaccount.update_attributes(bankaccount_params) && @bankaccount.update_attribute(:answered, Time.new)
      flash[:info]="Votre réponse a été communiquée au commissaire aux comptes."
      redirect_to bankaccounts_url
    else
      flash[:info]="Une erreur est survenue. Veuillez nous contacter."
      redirect_to bankaccounts_url
    end

  else

    if @bankaccount.update_attributes(bankaccount_params) && @bankaccount.update_attribute(:answered, Time.new(9999, 9, 9, 9, 9, 9))
      flash[:info]="La circularisation a bien été rejetée."  
      redirect_to bankaccounts_url
    else
      flash[:info]="Une erreur est survenue. Veuillez nous contacter."
      redirect_to bankaccounts_url
    end

end
end

def reject
  @bankaccount = Bankaccount.find(params[:id])
  if @bankaccount.update_attributes(bankaccount_params) && @bankaccount.update_attribute(:answered, Time.new(9999, 9, 9, 9, 9, 9))
    flash[:info]="La circularisation a bien été rejetée."
    redirect_to bankaccounts_url
  else
    flash[:info]="Une erreur est survenue. Veuillez nous contacter."
    redirect_to bankaccounts_url
  end
end

def report
  @bankaccount = Bankaccount.find(params[:id])
  @client = @bankaccount.client
  @bank = @bankaccount.bank
  @clientcontact = Clientcontact.find_by(client: @client)
  @bankcontact = Bankcontact.find_by(bank: @bank)  
  @user = current_user
  @data = :id
  #not sure why I could not use a regular report template - somehow it created an indefinite loop 
  render '/bankaccounts/summary/'
end

def reset_bank_only
  @bankaccount = Bankaccount.find(params[:id])
  @bankaccount.update_attribute(:answered, nil)
  @bankaccount.update_attribute(:comments, nil)
  
  flash[:info]="La réponse de la banque a été réinitialisée."
  redirect_to bankaccounts_url
end

def reset
  @bankaccount = Bankaccount.find(params[:id])
  @bankaccount.update_attribute(:shared, nil)
  @bankaccount.update_attribute(:signed, nil)
  @bankaccount.update_attribute(:issued, nil)
  @bankaccount.update_attribute(:answered, nil)
  flash[:info]="Le compte a été réinitialisé."
  redirect_to bankaccounts_url
end

private

def bankaccount_params
  params.require(:bankaccount).permit(:comments)
end

end
