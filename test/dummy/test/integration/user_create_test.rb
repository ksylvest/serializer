require 'test_helper'

class UserCreateTest < ActionDispatch::IntegrationTest

  fixtures :all

  test "create user" do
    get new_user_path
    assert_response :success

    post users_path, { :name => users(:default).name, :email => users(:default).email, :fb_share => "0", :tw_share => "0", :tb_share => "false" }
    assert_response :redirect

    follow_redirect!
  end

end
