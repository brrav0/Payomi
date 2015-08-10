class ApplicationMailer < ActionMailer::Base
  default from: "pasdereponse@circularisation.com"
  layout 'mailer'

def send_for_rake
clientcontact = Clientcontact.find(8)
mail to: clientcontact.email
end

end
