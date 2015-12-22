class Confirmation < ActiveRecord::Base

  #attr_accessible :file

  before_save :default_status

  belongs_to :client
  belongs_to :bank
  belongs_to :user
  has_many :attached_files
  validates :user_id, presence: true

  mount_uploader :file, FileUploader
  mount_uploader :file_answer, FileUploader

  def default_status
    self.status ||= 'En cours'
  end

end
