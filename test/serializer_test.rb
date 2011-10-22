require 'test_helper'

class SerializerTest < ActiveSupport::TestCase
  test "serializer is a module" do
    assert_kind_of Module, Serializer
  end
end
