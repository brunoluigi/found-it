require "test_helper"

class ItemViewTest < ActiveSupport::TestCase
  def setup
    @item_view = item_view(:first)
    @new_item_view = ItemView.new(
      ip_address: "192.168.1.2",
      item: items(:one),
      anon_user_hash: "9876543210"
    )
  end

  test "should save item view" do
    assert @new_item_view.save, "Failed to save the item view"
  end

  test "should not save item view without ip address" do
    @new_item_view.ip_address = nil
    assert_not @new_item_view.save, "Saved the item view without an ip address"
  end

  test "should not save item view without anon user hash" do
    @new_item_view.anon_user_hash = nil
    assert_not @new_item_view.save, "Saved the item view without an anon user hash"
  end

  test "should not save item view with duplicate ip address and anon user hash" do
    @new_item_view.ip_address = @item_view.ip_address
    @new_item_view.anon_user_hash = @item_view.anon_user_hash
    assert_not @new_item_view.save, "Saved the item view with a duplicate ip address and anon user hash"
  end
end
