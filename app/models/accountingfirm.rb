class Accountingfirm < ActiveRecord::Base
  has_many :users

  validates :name, presence: true
  validates :number_and_street, presence: true
  validates :zip_code, presence: true, length: { is: 5 }
  validates :city, presence: true

end
