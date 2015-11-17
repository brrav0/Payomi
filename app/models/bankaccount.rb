class Bankaccount < ActiveRecord::Base
  belongs_to :client
  belongs_to :user
  belongs_to :bank
  has_many :attached_files
  validates :client_id, presence: true
  validates :bank_id, presence: true
  validates :number, presence: true, length: { is: 11 }
  validates :currency, presence: true, length: { is: 3 }
  validates :balance, presence: true
  validates :comments, presence: true, :if => :issued?

  def issued?
    issued.nil? == false
    #is issued is not empty (initial state) then it is false then it returns true
  end




end
