class User < ActiveRecord::Base
  
  belongs_to :account
    
  has_serialized :settings do |settings|
    settings.define :tw_share, :default => true, :type => :boolean
    settings.define :fb_share, :default => true, :type => :boolean
    settings.define :tb_share, :default => true, :type => :boolean
    
    settings.define :status, :default => :user, :type => :symbol
    settings.define :location, :type => :string
    
    settings.define :percentage, :default => 0.0, :type => :float
    
    settings.define :permissions, :default => [], :type => :array
    
    settings.define :mystery
  end
  
end
