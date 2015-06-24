class Client < ActiveRecord::Base
  belongs_to :user
  has_many :clientcontacts, dependent: :destroy
  has_many :bankaccounts
  validates :user_id, presence: true
  validates :name, presence: true
  validates :number_and_street, presence: true
  validates :zip_code, presence: true, length: { is: 5 }
  validates :city, presence: true
  
end
