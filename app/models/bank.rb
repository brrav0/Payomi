class Bank < ActiveRecord::Base
  has_many :bankcontacts, dependent: :destroy
  has_many :bankaccounts

  validates :name, presence: true
  validates :number_and_street, presence: true
  validates :zip_code, presence: true, length: { is: 5}
  validates :city, presence: true
end
