require 'test_helper'

class BankaccountsControllerTest < ActionController::TestCase

test "should render home page with information for unidentified user" do
get :index
assert_select "a[href=?]", signup_path
assert_select "a[href=?]", contact_path, count:2
assert_select "a[href=?]", about_path
assert_select "a[href=?]", help_path
#general home template rendered if the user is not identified
assert_template 'static_pages/home'
end

#for what is rendered depending on each user refer to the integration user test (integration/users_login_test.rb)


end
