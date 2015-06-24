require 'test_helper'

class AccountingfirmTest < ActiveSupport::TestCase

def setup
@accountingfirm = accountingfirms(:accountingfirm)
end

test "should be valid" do
assert @accountingfirm.valid? 
end


test "name should be present" do
@accountingfirm.name = "   "
assert_not @accountingfirm.valid?
end

test "number_and_street should be present" do
@accountingfirm.number_and_street = "   "
assert_not @accountingfirm.valid?
end

test "zip_code should be present" do
@accountingfirm.zip_code = "   "
assert_not @accountingfirm.valid?
end


test "zip_code should not be less than 5 characters" do
@accountingfirm.zip_code = "aaaa"
assert_not @accountingfirm.valid?
end

test "zip_code should not be more than 5 characters" do
@accountingfirm.zip_code = "aaaaaa"
assert_not @accountingfirm.valid?
end

test "city should be present" do
@accountingfirm.city = "   "
assert_not @accountingfirm.valid?
end


end
