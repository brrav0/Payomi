class Bankcontact < ActiveRecord::Base
  belongs_to :bank
  validates :bank_id, presence: true
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false }

def send_notification_to_bankcontact

#system "rake notify_banks"
UserMailer.notification_bankcontact(self).deliver_now
end

end
