class Client < ActiveRecord::Base
  belongs_to :user
  has_many :clientcontacts, dependent: :destroy
  has_many :bankaccounts
  validates :user_id, presence: true
  validates :name, presence: true
  validates :number_and_street, presence: true
  validates :zip_code, presence: true, length: { is: 5 }
  validates :city, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true, length: {is: 10 }

  def self.search(query)
    where("name like ?","%#{query}%") 
  end

  def send_notification_to_client
    ClientcontactMailer.notification_clientcontact(self).deliver_now
  end

  
end
