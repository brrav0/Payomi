class TestsController < ApplicationController

def scheduler
  @name = Array.new
  #bankaccounts = Bankaccount.where.not(issued:nil).where(answered:nil)
  #@bankcontacts = Bankcontact.find_by_sql("SELECT bankcontacts.email FROM bankcontacts INNER JOIN bankaccounts ON bankcontacts.bank_id = bankaccounts.bank_id")
  @bankaccounts = Bankaccount.includes(bank: :bankcontacts).where.not(issued:nil).where(answered:nil)

end

def test_from_scheduler
  puts "test from controller"
end
end
