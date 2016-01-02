require 'rails_helper'

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    # Choose a test framework:
    with.test_framework :rspec

    with.library :rails
  end
end

RSpec.describe Client, type: :model do

   it { should validate_presence_of(:user_id) }

    #it "must have a name" do    
    #subject.should have(1).error_on(:name)
  end
