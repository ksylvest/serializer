require 'test_helper'

class UserUpdateTest < ActionDispatch::IntegrationTest
  fixtures :all

  test "update user" do
    get edit_user_path(users(:demo))
    assert_response :success
    
    post users_path, { name: users(:demo).name, email: users(:demo).email, fb_share: "0", tw_share: "0" }
    assert_response :redirect
    
    follow_redirect!
  end
  
end
