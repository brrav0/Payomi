class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_activation.subject
  #
  def send_email_to_notify_banks_of_pending_confirmations
    @bankaccounts = Bankaccount.all
    emails = Array.new
    @bankaccounts.each do |bankaccount|
      if !bankaccount.issued.nil? && bankaccount.answered.nil?
        emails = emails.push(bankaccount.bank.email)
        #but similar emails get arrayed so emails will be sent numerous time and error no implicit conversion of string into Array
      end
      end
    emails.uniq.each do |email| 
      mail to: email, subject: "Vous avez des circularisations en attente de réponse"
    end
  end

  def account_activation(user)
      @user = user
    mail to: user.email, subject: "Activation de votre compte"

  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(user)

   @user = user
    mail to: user.email, subject: "Ré-initialisation de votre mot de passe"

  end

  def notification_clientcontact(clientcontact)
    @clientcontact = clientcontact
    mail to: clientcontact.email, subject: "Votre commissaire aux comptes vous demande de signer une circularisation"
  end

  def notification_bankcontact(bankcontact)
    @bankcontact = bankcontact
    mail to: bankcontact.email, subject: "Vous avez des circularisations en attente de réponse"
  end
  
  def test_sentence
    puts "from the UserMailer"
  end
end
