require 'test_helper'

class SubscriptionTest < ActiveSupport::TestCase

  test "accepts nested attributes from belongs_to side of association" do
    @user = User.create()
    @subscription = @user.create_subscription()

    user_id = @user.id.to_s

    @subscription.update_attributes({ "user_attributes" => { "notifications" => "1", "id" => user_id } })
    @user.reload

    assert @user.subscription, "should have an subscription"
    assert @user.notifications?, "should have accepted nested attributes setting to true"

    @subscription.update_attributes({ "user_attributes" => { "notifications" => "0", "id" => user_id } })
    @user.reload

    assert !@user.notifications?, "should have accepted nested attributes setting to false"
  end

end
