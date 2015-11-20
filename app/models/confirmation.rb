class Confirmation < ActiveRecord::Base

  before_save :default_status

  belongs_to :client
  belongs_to :bank
  belongs_to :user
  has_many :attached_files
  validates :user_id, presence: true

  def default_status
    self.status ||= 'Envoyée'
  end

end
