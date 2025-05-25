require "application_system_test_case"

class LoginTest < ApplicationSystemTestCase
  test "visiting the login page" do
    visit new_session_path
    assert_selector "h1", text: /sign in to foundit/i
  end

  test "logging in with valid credentials" do
    user = users(:one)
    visit new_session_path
    fill_in name: /Email_Address/i, with: user.email_address
    fill_in "Password", with: "password"
    click_on "Sign in"
    assert_current_path welcome_path
  end
end
