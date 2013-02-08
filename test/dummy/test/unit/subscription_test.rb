require 'test_helper'

class SubscriptionTest < ActiveSupport::TestCase

  test "accepts nested attributes from belongs_to side of association" do
    @user = User.create()
    @subscription = @user.create_subscription()

    user_id = @user.id.to_s

    @subscription.update_attributes({ "user_attributes" => { "notification_comment" => "1", "id" => user_id } })
    @user.reload

    assert @user.subscription, "should have an subscription"
    assert @user.notification_comment?, "should have accepted nested attributes setting to true"

    @subscription.update_attributes({ "user_attributes" => { "notification_comment" => "0", "id" => user_id } })
    @user.reload

    assert !@user.notification_comment?, "should have accepted nested attributes setting to false"
  end

end
