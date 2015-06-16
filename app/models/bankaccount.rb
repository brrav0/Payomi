class Bankaccount < ActiveRecord::Base
  belongs_to :client
  belongs_to :user
  belongs_to :bank
  validates :client_id, presence: true
  validates :bank_id, presence: true
  validates :number, presence: true
  validates :currency, presence: true, length: { maximum: 3 }
  validates :balance, presence: true
end
