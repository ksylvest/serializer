require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  
  fixtures :all
  
  test "accepts nested attributes for users" do    
    @account = Account.create({ :user_attributes => { :tw_share => false, :fb_share => false, :tb_share => true } })
    @user = @account.user
    
    assert @user.account, "should have an account"
    assert !@user.fb_share?, "should have accepted nested attributes"
    assert !@user.tw_share?, "should have accepted nested attributes"
    assert @user.tb_share?, "should have accepted nested attributes"
  end
  
end
