require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  test "defaults" do
    @user = User.create(name: "Kevin", email: "kevin@ksylvest.com")
    
    assert @user.fb_share?, "should have defaults"
    assert @user.tw_share?, "should have defaults"
  end
  
  test "missing settings" do
    @user = users(:missing)
    
    assert @user.fb_share?, "should have defaults"
    assert @user.tw_share?, "should have defaults"
    
    @user.fb_share = false
    @user.tw_share = false
    
    assert !@user.fb_share?, "should change settings"
    assert !@user.tw_share?, "should change settings"
  end
  
  test "falsify then truthify attributes" do
    @user = User.create(name: "Kevin", email: "kevin@ksylvest.com", fb_share: false, tw_share: false)
    
    assert !@user.fb_share?, "should not have FB sharing if false"
    assert !@user.tw_share?, "should not have TW sharing if false"
    
    @user.fb_share = true
    @user.tw_share = true
    @user.save
    
    assert @user.fb_share?, "should have FB sharing if toggled to true"
    assert @user.tw_share?, "should have TW sharing if toggled to true"
  end
  
  test "truthify then falsify attributes" do
    @user = User.create(name: "Kevin", email: "kevin@ksylvest.com", fb_share: true, tw_share: true)
    
    assert @user.fb_share?, "should have FB sharing if true"
    assert @user.tw_share?, "should have TW sharing if true"
    
    @user.fb_share = false
    @user.tw_share = false
    @user.save
    
    assert !@user.fb_share?, "should not have FB sharing if toggled to false"
    assert !@user.tw_share?, "should not have TW sharing if toggled to false"
  end
  
end
