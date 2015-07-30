require 'test_helper'

class BankaccountsControllerTest < ActionController::TestCase

def setup
  @auditor = users(:auditor)
  @bankcontact = users(:bankcontact)
  @clientcontact = users(:clientcontact)
end

test "should render home page with information for unidentified user" do
get :index
assert_select "a[href=?]", signup_path
assert_select "a[href=?]", contact_path, count:2
assert_select "a[href=?]", about_path
assert_select "a[href=?]", help_path
assert_template 'static_pages/home'
end

test "auditors should get the indexuser view" do
  log_in_as(@auditor)
  get :index
  assert_template 'bankaccounts/indexuser'
end
#errors not understood
#test "clientcontact should get the indexclient view" do
#  log_in_as(@clientcontact)
#  get :index
#  assert_template 'bankaccounts/indexclient'
#end

#test "bankcontact should get the indexbank view" do
#  log_in_as(@bankcontact)
#  get :index
#  assert_template 'bankaccounts/indexbank'
#end

#test "admin should get the indexadmin view" do
#  log_in_as(@admin)
#  get :index
#  assert_template 'bankaccounts/indexadmin'
#end

test "not logged-in user should get the home page" do
  get :index
  assert_template 'static_pages/home'
end

end
