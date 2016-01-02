require 'rails_helper'

#Shoulda::Matchers.configure do |config|
#  config.integrate do |with|
    # Choose a test framework:
#    with.test_framework :rspec

#    with.library :rails
#  end
#end

RSpec.describe Client, type: :model do

   it { should validate_presence_of(:user_id) }
   it { should validate_presence_of(:name) }
   it { should validate_presence_of(:number_and_street) }
   it { should validate_presence_of(:zip_code) }
   it { should validate_presence_of(:city) }
   it { should validate_presence_of(:first_name) }
   it { should validate_presence_of(:last_name) }
   it { should validate_presence_of(:email) }
   it { should validate_presence_of(:phone_number) }

   it { should validate_length_of(:zip_code).is_equal_to(5) }
   it { should validate_length_of(:phone_number).is_equal_to(10) }

    #it "must have a name" do    
    #subject.should have(1).error_on(:name)
  end
