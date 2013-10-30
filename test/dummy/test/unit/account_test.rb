require 'test_helper'

class AccountTest < ActiveSupport::TestCase

  fixtures :all

  test "accepts nested attributes for users on create" do
    @account = Account.create({ :name => "Personal", :user_attributes => { :tw_share => false, :fb_share => false, :tb_share => true } })
    @user = @account.user

    assert @user.account, "should have an account"
    assert !@user.fb_share?, "should have accepted nested attributes"
    assert !@user.tw_share?, "should have accepted nested attributes"
    assert @user.tb_share?, "should have accepted nested attributes"
  end

  test "accepts nested attributes for users on update" do
    @account = Account.create(:name => "Personal")
    @account.create_user()

    @account.update_attributes({ :user_attributes => { :tw_share => true, :fb_share => false, :tb_share => true } })

    assert !@account.user.fb_share?, "should have accepted nested attributes"
    assert @account.user.tw_share?, "should have accepted nested attributes"
    assert @account.user.tb_share?, "should have accepted nested attributes"
  end

end
