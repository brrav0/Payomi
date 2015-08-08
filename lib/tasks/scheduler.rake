desc "Notify banks"
task :notify_banks => :environment do  
bankcontact = Bankcontact.find(5)
#UserMailer.notification_bankcontact(bankcontact).deliver_now
bankcontact.send_notification_to_bankcontact
end
