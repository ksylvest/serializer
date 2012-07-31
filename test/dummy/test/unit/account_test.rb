require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  
  fixtures :all
  
  test "accepts nested attributes for users" do
    Rails.logger.info "ALPHA"
    
    @account = accounts(:default)
    
    @account.attributes = { :user_attributes => { :tw_share => false, :fb_share => false, :tb_share => true } }
    @account.save
    
    @user = @account.user
    @user.reload
    
    assert @user.account, "should have an account"
    assert !@user.fb_share?, "should have accepted nested attributes"
    assert !@user.tw_share?, "should have accepted nested attributes"
    assert @user.tb_share?, "should have accepted nested attributes"
    
    Rails.logger.info "OMEGA"
  end
  
end
