require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(
      name: "Test User",
      email_address: "test@test.com",
      phone: "1234567890",
      password: "password"
    )
  end

  test "should save user" do
    assert @user.save, "Failed to save the user"
  end

  test "should not save user without email" do
    @user.email_address = nil
    assert_not @user.save, "Saved the user without an email"
  end

  test "should save user without phone" do
    @user.phone = nil
    assert @user.save, "Saved the user without a phone"
  end

  test "should not save user with invalid email" do
    @user.email_address = "test.com"
    assert_not @user.save, "Saved the user with an invalid email"
  end

  test "should not save user with duplicate email" do
    assert @user.save, "Failed to save the first user"
    assert User.exists?(email_address: "test@test.com"), "First user not found in database"

    second_user = User.new(
      name: "Second User",
      email_address: "test@test.com",
      phone: "9876543210",
      password: "password123"
    )
    assert_not second_user.save, "Saved a user with a duplicate email"
  end

  test "should save user with phone containing non-digits (they get stripped)" do
    @user.phone = "123-456-7890"
    assert @user.save, "Failed to save user with formatted phone"
    assert_equal "1234567890", @user.phone, "Phone should be normalized to digits only"
  end

  test "should not save user without password" do
    @user.password = nil
    assert_not @user.save, "Saved the user without a password"
  end

  test "should not save user with short password" do
    @user.password = "short"
    assert_not @user.save, "Saved the user with a short password"
  end
end
