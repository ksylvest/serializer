require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  fixtures :all
  
  test "defaults" do
    @user = User.create(:name => "Kevin", :email => "kevin@example.com")
    
    assert @user.fb_share?, "should have defaults"
    assert @user.tw_share?, "should have defaults"
    assert @user.tb_share?, "should have defaults"
  end
  
  test "missing settings" do
    @user = users(:missing)
    
    assert @user.fb_share?, "should have defaults"
    assert @user.tw_share?, "should have defaults"
    assert @user.tb_share?, "should have defaults"
    
    @user.fb_share = false
    @user.tw_share = false
    @user.tb_share = "false"
    @user.save
    
    assert !@user.fb_share?, "should change settings"
    assert !@user.tw_share?, "should change settings"
    assert !@user.tb_share?, "should change settings"
  end
  
  test "falsify then truthify attributes" do
    @user = User.create(:name => "Kevin", :email => "kevin@example.com", :fb_share => false, :tw_share => false, :tb_share => "false")
    
    assert !@user.fb_share?, "should not have FB sharing if false"
    assert !@user.tw_share?, "should not have TW sharing if false"
    assert !@user.tb_share?, "should not have TW sharing if false"
    
    @user.fb_share = true
    @user.tw_share = true
    @user.tb_share = "true"
    @user.save
    
    assert @user.fb_share?, "should have FB sharing if toggled to true"
    assert @user.tw_share?, "should have TW sharing if toggled to true"
    assert @user.tb_share?, "should have Tumblr sharing if toggled to true"
  end
  
  test "truthify then falsify attributes" do
    @user = User.create(:name => "Kevin", :email => "kevin@example.com", :fb_share => true, :tw_share => true, :tb_share => "true")
    
    assert @user.fb_share?, "should have FB sharing if true"
    assert @user.tw_share?, "should have TW sharing if true"
    assert @user.tb_share?, "should have Tumblr sharing if toggled to true"
    
    @user.fb_share = false
    @user.tw_share = false
    @user.tb_share = "false"
    @user.save
    
    assert !@user.fb_share?, "should not have FB sharing if toggled to false"
    assert !@user.tw_share?, "should not have TW sharing if toggled to false"
    assert !@user.tb_share?, "should not have Tumblr sharing if toggled to false"
  end
  
  test "configuring symbol attributes" do
    @user = User.create(:name => "Kevin", :email => "kevin@example.com")
    
    @user.status = "admin"
    
    assert @user.status.eql? :admin
  end
  
  test "configuring array and hash attributes" do
    @user_a = User.create(:name => "Alpha", :email => "alpha@example.com")
    @user_b = User.create(:name => "Omega", :email => "omega@example.com")
    
    @user_a.permissions << "update"
    @user_b.permissions << "create"
    
    assert @user_a.permissions.eql? ["update"]
    assert @user_b.permissions.eql? ["create"]
  end
  
  test "configuring string attributes" do
    @user_a = User.create(:name => "Alpha", :email => "alpha@example.com")
    @user_b = User.create(:name => "Omega", :email => "omega@example.com")
    
    @user_a.location = "France"
    @user_b.location = "Mexico"
    
    assert @user_a.location.eql? "France"
    assert @user_b.location.eql? "Mexico"
  end
  
  test "a missing default" do
    @user = User.create(:name => "Kevin", :email => "kevin@example.com")
    
    assert @user.location.eql? nil
  end
  
end
