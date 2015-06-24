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

test "account number should not be less than 11 digits and/or letters" do
@bankaccount.number = "aaaaaaaaaa"
assert_not @bankaccount.valid?
end

test "account number should not be more than 11 digits and/or letters" do
@bankaccount.number = "aaaaaaaaaaaa"
assert_not @bankaccount.valid?
end

test "account currency should be present" do
@bankaccount.currency = "   "
assert_not @bankaccount.valid?
end

test "account currency should not be less than 3 letters" do
@bankaccount.currency = "aa"
assert_not @bankaccount.valid?
end

test "account currency should not be more than 3 letters" do
@bankaccount.currency = "aaaa"
assert_not @bankaccount.valid?
end


test "account balance should be present" do
@bankaccount.balance = "   "
assert_not @bankaccount.valid?
end

end
