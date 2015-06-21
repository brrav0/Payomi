require 'test_helper'

class BankaccountTest < ActiveSupport::TestCase

def setup
@bankaccount = bankaccounts(:bankaccount)
end

test "should be valid" do
assert @bankaccount.valid?
end

test "client id should be present" do
@bankaccount.client_id = nil
assert_not @bankaccount.valid?
end

test "bank id should be present" do
@bankaccount.bank_id = nil
assert_not @bankaccount.valid?
end

test "account number should be present" do
@bankaccount.number = "   "
assert_not @bankaccount.valid?
end

test "account currency should be present" do
@bankaccount.currency = "   "
assert_not @bankaccount.valid?
end

test "account balance should be present" do
@bankaccount.balance = "   "
assert_not @bankaccount.valid?
end

test "account currency should be 3 letter" do
@bankaccount.currency = "a" * 4
end

end
