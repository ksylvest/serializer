class Subscription < ActiveRecord::Base

  belongs_to :user

  attr_accessible :user_attributes
  accepts_nested_attributes_for :user

end
