require "test_helper"

class ItemTest < ActiveSupport::TestCase
  def setup
    @item = Item.new(
      content: "Test Item",
      user: users(:one)
    )
  end

  test "should save item" do
    assert @item.save, "Failed to save a valid item"
  end

  test "should not save item without user" do
    @item.user = nil
    assert_not @item.save, "Saved the item without a user"
  end
end
