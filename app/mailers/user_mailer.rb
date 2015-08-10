class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_activation.subject
  #
  def email_test
    mail to: "bastien.ravandison@gmail.com", subject: "test pour rake"
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
