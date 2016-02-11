class Restaurant < ActiveRecord::Base

  before_save :default_likes

  belongs_to :user
  validates :user_id, presence: true
  has_many :likes


  def default_likes
    self.nboflikes ||= 0
  end

end
