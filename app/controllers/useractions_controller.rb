class UseractionsController < ApplicationController

#items hereunder should be refactored to be documented in bankaccounts models
def share
  @bankaccount = Bankaccount.find(params[:id])
  if @bankaccount.update_attribute(:shared, Time.now.to_formatted_s(:short))
    @client = @bankaccount.client
    #@client.send_notification_to_clientcontact
    flash[:info]="La circularisation a été envoyée au signataire autorisé pour signature."
    redirect_to bankaccounts_url
  else
    flash[:info]="Une erreur est survenue. Veuillez nous contacter."
    redirect_to bankaccounts_url
  end
end

def sign
  @bankaccount = Bankaccount.find(params[:id])
  if @bankaccount.update_attribute(:signed, Time.now.to_formatted_s(:short))
    flash[:info]="La circularisation est signée. Votre commissaire aux comptes peut désormais l'acheminer à votre banque."
    redirect_to bankaccounts_url
  else
    flash[:info]="Une erreur est survenue. Veuillez nous contacter."
    redirect_to bankaccounts_url
  end
end

def issue
  @bankaccount = Bankaccount.find(params[:id])
  if @bankaccount.update_attribute(:issued, Time.now.to_formatted_s(:short))
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

def check_by_auditor
  @bankaccount = Bankaccount.find(params[:id])
  @client = @bankaccount.client
  @bank = @bankaccount.bank
  @clientcontact = Clientcontact.find_by(client: @client)
  @bankcontact = Bankcontact.find_by(bank: @bank)
  @user = current_user
  @cac = @client.user
  @id = @bankaccount.id

  render '/bankaccounts/check_by_auditor/'
end

def answer
  @bankaccount = Bankaccount.find(params[:id])
  if @bankaccount.update_attributes(bankaccount_params) && @bankaccount.update_attribute(:answered, Time.now.to_formatted_s(:short))
    flash[:info]="Votre réponse a été communiquée au commissaire aux comptes."
    redirect_to bankaccounts_url
  else
    flash[:info]="Une erreur est survenue. Veuillez nous contacter."
    redirect_to bankaccounts_url
  end
end

def answer_with_comments
  @bankaccount = Bankaccount.find(params[:id])
  #all that stuff hereunder became necessary after some code refactoring - no idea why
  @client = @bankaccount.client
  @user = current_user
  @cac = @client.user
  @id = @bankaccount.id
  @bank = @bankaccount.bank
  @bankcontact = Bankcontact.find_by(bank: @bank)

  if params[:conf]

   #update_attribue (singular) does not go through the classic validation process
   #f @bankaccount.update_attribute(:answered, Time.now.to_formatted_s(:short)) && @bankaccount.update_attribute(:answer, "confirmée") && 
    @bankaccount.update_attribute(:answered, Time.now.to_formatted_s(:short))
    @bankaccount.update_attribute(:answer, 'confirmée')
    if !params[:bankaccount][:comments].empty?
      @bankaccount.update_attribute(:comments, params[:bankaccount][:comments])
      flash[:info]="Votre réponse a été communiquée au commissaire aux comptes avec vos commentaires."
    redirect_to bankaccounts_url
    else
    flash[:info]="Votre réponse a été communiquée au commissaire aux comptes sans commentaires."
    redirect_to bankaccounts_url
    end
  else

  if @bankaccount.update_attributes(bankaccount_comments_params)
    @bankaccount.update_attribute(:answered, Time.now.to_formatted_s(:short))
    @bankaccount.update_attribute(:answer, 'rejetée')
    flash[:info]="Votre rejet de la circularisation a été communiquée au commissaire aux compte avec vos commentaires."
   # if @bankaccount.update_attributes(bankaccount_params) && @bankaccount.update_attribute(:answered, Time.now.to_formatted_s(:short)) && @bankaccount.update_attribute(:answer, "rejetée") 
  #  if @bankaccount.update_attribute(:answered, Time.now.to_formatted_s(:short)) && @bankaccount.update_attribute(:answer, "rejetée") && @bankaccount.update_attribute(:comments, params[:comments])
   #   flash[:info]="La circularisation a bien été rejetée."  
      redirect_to bankaccounts_url
   else
   #   flash[:info]="Une erreur est survenue. Veuillez nous contacter."
     render 'bankaccounts/check'
   # end
  end
end
end

def reject
  @bankaccount = Bankaccount.find(params[:id])
  if @bankaccount.update_attributes(bankaccount_params) && @bankaccount.update_attribute(:answered, Time.now.to_formatted_s(:short)) && @bankaccount.update_attribute(:comments, params[:comments])
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
  @cac = @client.user
  #not sure why I could not use a regular report template - somehow it created an indefinite loop 
  render '/bankaccounts/summary/'
end

def reset_bank_only
  @bankaccount = Bankaccount.find(params[:id])
  @bankaccount.update_attribute(:answered, nil)
  @bankaccount.update_attribute(:answered, nil)
  @bankaccount.update_attribute(:answer, nil)
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
  params.require(:bankaccount).permit(:answered,:answer,:comments)
end


def bankaccount_comments_params
  params.require(:bankaccount).permit(:comments)
end

end
