require 'test_helper'

class UserUpdateTest < ActionDispatch::IntegrationTest

  fixtures :all

  test "update user" do
    get edit_user_path(users(:default))
    assert_response :success

    post users_path, { :name => users(:default).name, :email => users(:default).email, :fb_share => "0", :tw_share => "0", :tb_share => "true" }
    assert_response :redirect

    follow_redirect!
  end

end
