class Spot < ActiveRecord::Base
  belongs_to :user
  has_many :microposts
  accepts_nested_attributes_for :microposts
end
