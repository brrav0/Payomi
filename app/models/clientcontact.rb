class Clientcontact < ActiveRecord::Base
  belongs_to :client
  validates :client_id, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
end
