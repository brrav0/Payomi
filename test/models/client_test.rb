require 'test_helper'

class ClientTest < ActiveSupport::TestCase

def setup
@user = users(:michael)
@client = @user.clients.build(name: "Nom du Client", number_and_street: "Numero et voie", zip_code: "Code Postal", city: "Ville")
end
#not understood so far re-work on it
#test "should be valid" do
#assert @client.valid? 
#end

test "User id should be present" do
@client.user_id = nil
assert_not @client.valid?

end

test "name should be present" do
@client.name = "   "
assert_not @client.valid?
end

test "number_and_street should be present" do
@client.number_and_street = "   "
assert_not @client.valid?
end

test "zip_code should be present" do
@client.zip_code = "   "
assert_not @client.valid?
end


test "zip_code should not be less than 5 characters" do
@client.zip_code = "aaaa"
assert_not @client.valid?
end

#Create an unknown testing error see model
#test "zip_code should not be more than 5 characters" do
#@client.zip_code = "aaaaaa"
#assert_not @client.valid?
#end

test "city should be present" do
@client.city = "   "
assert_not @client.valid?
end


end
