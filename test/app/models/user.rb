class User < ActiveRecord::Base
  
  has_serialized :settings do |settings|
    settings.define :tw_share, default: true, type: :boolean
    settings.define :fb_share, default: true, type: :boolean
  end
  
end
