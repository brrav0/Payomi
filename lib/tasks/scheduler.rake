task :notify_banks_of_pending_confirmations => :environment do
  #puts "test"
  #mail to: contact.email, subject: "Votre commissaire aux comptes vous demande de signer une circularisation"
  #user = User.find(1)
  #puts user.email
  User.notify_banks_of_pending_confirmations

end

