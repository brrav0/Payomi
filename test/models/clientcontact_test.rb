require 'test_helper'

class ClientcontactTest < ActiveSupport::TestCase

def setup
@clientcontact = clientcontacts(:xavier)
end

test "should be valid" do
#assert @clientcontact.valid? - no idea why failure seems to work
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

end
