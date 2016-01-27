require 'rails_helper'

RSpec.describe Bank, type: :model do

   it { should validate_presence_of(:name) }
   it { should validate_presence_of(:number_and_street) }
   it { should validate_presence_of(:zip_code) }
   it { should validate_presence_of(:city) }
   it { should validate_length_of(:zip_code).is_equal_to(5) }

    #it "must have a name" do    
    #subject.should have(1).error_on(:name)
  end
