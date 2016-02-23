class Micropost < ActiveRecord::Base
  belongs_to :spot
  belongs_to :user
  has_many :recommendations
  accepts_nested_attributes_for :spot
  accepts_nested_attributes_for :recommendations
end
