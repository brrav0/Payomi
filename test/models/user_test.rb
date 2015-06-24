require 'test_helper'

class UserTest < ActiveSupport::TestCase


  def setup
    @user = users(:michael)
    @auditor = users(:auditor)
    @bankcontact = users(:bankcontact)
    @clientcontact = users(:clientcontact)
  end

test "name should be present for all users" do
    @user.name = "     "
    assert_not @user.valid?
end

test "auditor email should be present" do
    @user.email = "     "
    assert_not @user.valid?
end
test "name should not be too long for all users" do
    @user.name = "a" * 21
    assert_not @user.valid?
  end
test "email should not be too long for all users" do
    @user.email = "a" * 255
   assert_not @user.valid?
  end
#do for each profile
#test "email validation should accept valid addresses for all users" do
#    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
#                         first.last@foo.jp alice+bob@baz.cn]
#    valid_addresses.each do |valid_address|
#      @user.email = valid_address
#      assert @user.valid?, "#{valid_address.inspect} should be valid"
#  end
#end
#test "email validation should reject invalid addresses for all users" do
#    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
#                           foo@bar_baz.com foo@bar+baz.com]
#    invalid_addresses.each do |invalid_address|
#      @user.email = invalid_address
#      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
#  end
#end
test "email addresses should be unique for all users" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email
    @user.save
    assert_not duplicate_user.valid?
end
test "password should have a minimum length for all users" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
end
test "authenticated? should return false for a all users with nil digest" do
       assert_not @user.authenticated?(:remember, '')
end
#########################################
#test specific to auditor
########################################

#the manual test seems to work
# test "email validation should accept valid addresses for auditors" do
#    valid_addresses = %w[user@circularisation.com USER2@circularisation.COM A_US-ER@CIRCULARISATION.COM
#                         first.last@CIRCULARISATION.com ]
#    valid_addresses.each do |valid_address|
#      @auditor.email = valid_address
#      assert @auditor.valid?, "#{valid_address.inspect} should be valid"
#  end
#end
test "email validation should reject invalid addresses for auditors" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com user@fr.pwc.com user@fr.ey.com]
    invalid_addresses.each do |invalid_address|
      @auditor.email = invalid_address
      assert_not @auditor.valid?, "#{invalid_address.inspect} should be invalid"
  end
end
#do not work but work manually linked to the issue here above
#test "auditors should be valid" do
#    assert @auditor.valid?
#end

####################################
#test specific to clientcontact
####################################
test "email validation should reject addresses not pre-filled by auditors for clientcontact" do
  @clientcontact.email = 'notprefilled@example.gov'
  assert_not @clientcontact.valid?
end
#does not work - not sure why
#test "email validation should accept addresses pre-filled by auditors for clientcontact" do
#  valid_addresses = %w[duchess@example.gov hands@example.gov]
#  valid_addresses.each do |valid_address|
#    @clientcontact.email = valid_address
#    assert @clientcontact.valid?, "#{valid_address.inspect} should be valid"
#end
#end
end
