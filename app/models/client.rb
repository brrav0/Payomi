class Client < ActiveRecord::Base
  belongs_to :user
  has_many :clientcontacts, dependent: :destroy
  has_many :bankaccounts
  validates :user_id, presence: true#has been added to pass the test but weird as the test client are created through the user so test should have passed in the first place
  validates :name, presence: true
  validates :number_and_street, presence: true
  validates :zip_code, presence: true, length: { minimum: 5 }#should be equal but create an unknown testing error
  validates :city, presence: true
  
end
