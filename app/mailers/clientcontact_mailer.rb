class ClientcontactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
default 'Content-Transfer-Encoding' => '7bit'
  # with the following lookup:
  #
  #   en.user_mailer.account_activation.subject
  #



  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #

  def notification_clientcontact(clientcontact)
    #@clientcontact = clientcontact
    clientcontact = Clientcontact.find(4)
    mail to: clientcontact.email, subject: "Votre commissaire aux comptes vous demande de signer une circularisation"
  end


end
