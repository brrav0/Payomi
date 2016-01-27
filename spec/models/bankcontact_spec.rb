require 'rails_helper'

RSpec.describe Bankcontact, type: :model do

   it { should validate_presence_of(:bank_id) }
   it { should validate_presence_of(:first_name) }
   it { should validate_presence_of(:last_name) }
   it { should validate_presence_of(:email) }
   

    #it "must have a name" do    
    #subject.should have(1).error_on(:name)
  end
