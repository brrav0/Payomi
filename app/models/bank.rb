class Bank < ActiveRecord::Base
  has_many :bankcontacts, dependent: :destroy
  has_many :bankaccounts
end
