require 'test_helper'

class BankTest < ActiveSupport::TestCase

def setup
@bank = banks(:bank)
end

test "should be valid" do
assert @bank.valid? 
end


test "name should be present" do
@bank.name = "   "
assert_not @bank.valid?
end

test "number_and_street should be present" do
@bank.number_and_street = "   "
assert_not @bank.valid?
end

test "zip_code should be present" do
@bank.zip_code = "   "
assert_not @bank.valid?
end


test "zip_code should not be less than 5 characters" do
@bank.zip_code = "aaaa"
assert_not @bank.valid?
end

test "zip_code should not be more than 5 characters" do
@bank.zip_code = "aaaaaa"
assert_not @bank.valid?
end

test "city should be present" do
@bank.city = "   "
assert_not @bank.valid?
end


end
