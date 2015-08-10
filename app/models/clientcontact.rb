class Clientcontact < ActiveRecord::Base
  belongs_to :client
  validates :client_id, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false }


def send_notification_to_clientcontact
ClientcontactMailer.notification_clientcontact(self).deliver_now
end


end
