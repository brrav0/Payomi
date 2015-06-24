require 'test_helper'

class ClientcontactTest < ActiveSupport::TestCase

def setup
@clientcontact = clientcontacts(:xavier)
end

test "should be valid" do
assert @clientcontact.valid?
end

test "client id should be present" do
@clientcontact.client_id = nil
assert_not @clientcontact.valid?
end

test "first name should be present" do
@clientcontact.first_name = "   "
assert_not @clientcontact.valid?
end

test "last name should be present" do
@clientcontact.last_name = "   "
assert_not @clientcontact.valid?
end

test "email should be present" do
@clientcontact.email = "   "
assert_not @clientcontact.valid?
end

test "email validation should accept valid addresses" do
valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
valid_addresses.each do |valid_address|
@clientcontact.email = valid_address
assert @clientcontact.valid?, "#{valid_address.inspect} should be valid"
end
end

test "email validation should reject invalid addresses" do
invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
invalid_addresses.each do |invalid_address|
@clientcontact.email = invalid_address
assert_not @clientcontact.valid?, "#{invalid_address.inspect} should be invalid"
end
end

test "email addresses should be unique" do
duplicate_user = @clientcontact.dup
duplicate_user.email = @clientcontact.email.upcase
@clientcontact.save
assert_not duplicate_user.valid?
end


end
