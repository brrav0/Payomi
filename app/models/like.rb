class Like < ActiveRecord::Base

  belongs_to :user
  belongs_to :restaurant

  #validates :like, uniqueness: { scope: :user_id :restaurant_id }
  #validates_uniqueness_of :user :scope => :restaurant
  validates :user_id, uniqueness:true
  validates :user, uniqueness:true
  validates :number, presence:true
  #validates_uniqueness_of :user_id, :scope => :restaurant_id

end
