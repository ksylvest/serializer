class User < ActiveRecord::Base

  belongs_to :account
  has_one :subscription

  attr_accessible :name, :email
  attr_accessible :tw_share, :fb_share, :tb_share, :status, :location, :percentage, :permissions, :mystery, :notifications

  has_serialized :settings do |settings|
    settings.define :tw_share, :default => true, :type => :boolean
    settings.define :fb_share, :default => true, :type => :boolean
    settings.define :tb_share, :default => true, :type => :boolean

    settings.define :status, :default => :user, :type => :symbol
    settings.define :location, :type => :string

    settings.define :percentage, :default => 0.0, :type => :float

    settings.define :permissions, :default => [], :type => :array

    settings.define :mystery

    settings.define :notifications, :type => :boolean, :default => false
  end

end
