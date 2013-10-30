class Account < ActiveRecord::Base

  has_one :user

  attr_accessible :name
  attr_accessible :user_attributes
  accepts_nested_attributes_for :user

end
