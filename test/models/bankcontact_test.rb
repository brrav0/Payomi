require 'test_helper'

class BankcontactTest < ActiveSupport::TestCase

def setup
@bankcontact = bankcontacts(:bankcontact)
end

test "should be valid" do
@bankcontact.bank_id = nil
assert_not @bankcontact.valid?
end

test "first name should be present" do
@bankcontact.first_name = "   "
assert_not @bankcontact.valid?
end

test "last name should be present" do
@bankcontact.last_name = "   "
assert_not @bankcontact.valid?
end

test "email should be present" do
@bankcontact.email = "   "
assert_not @bankcontact.valid?
end

test "email should not be too long" do
@bankcontact.email = "a" * 244 + "@example.com"
assert_not @bankcontact.valid?
end

test "email validation should accept valid addresses" do
valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
valid_addresses.each do |valid_address|
@bankcontact.email = valid_address
assert @bankcontact.valid?, "#{valid_address.inspect} should be valid"
end
end

test "email validation should reject invalid addresses" do
invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
invalid_addresses.each do |invalid_address|
@bankcontact.email = invalid_address
assert_not @bankcontact.valid?, "#{invalid_address.inspect} should be invalid"
end
end

test "email addresses should be unique" do
duplicate_user = @bankcontact.dup
duplicate_user.email = @bankcontact.email.upcase
@bankcontact.save
assert_not duplicate_user.valid?
end


end
