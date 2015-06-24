ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'


class ActiveSupport::TestCase
  fixtures :all

  # Returns true if a test user is logged in.
  def is_logged_in?
    !session[:user_id].nil?
  end

  # Logs in a test user.
  def log_in_as(user, options = {})
    password    = options[:password]    || 'password'
    remember_me = options[:remember_me] || '1'
    if integration_test?
      post login_path, session: { email:       user.email,
                                  password:    password,
                                  remember_me: remember_me }
    else
      session[:user_id] = user.id
    end
  end
  #Logs in a test user but different from above for simplicity (merge both down the road)
  def log_in_as2(user, options = {})
      post login_path, session: { email:       user.email,
                                  password:    user.password}
  end



  private

    # Returns true inside an integration test.
    def integration_test?
      defined?(post_via_redirect)
    end
end

