require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

#code hereunder works do not change for clientcontact
#******************************************************************************#
#scheduler.in("10h") do

#@bank = Bank.find(1)

#@clientcontact = Clientcontact.first#create loop once additional contacts are inserted into the database
#if !@bank.bankaccounts.where.not(shared:nil).where(signed:nil).empty?
#@clientcontact.send_notification_to_clientcontact
#end

#end
#*****************************************************************************#

scheduler.every("10h") do

@bank = Bank.find(1)
@bankcontact = Bankcontact.first#loop additional contacts when inserted into the database
if !@bank.bankaccounts.where.not(issued:nil).where(answered:nil).empty?
@bankcontact.send_notification_to_bankcontact
end
end


