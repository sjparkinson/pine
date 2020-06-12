require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "join" do
    visit root_url
    click_link "Join"

    assert_current_path "/join"

    fill_in "Email address", with: "lkjh@example.com"
    fill_in "Display name", with: 'Jane Doe'
    fill_in "Password", with: default_password
    click_button "Join"

    assert_current_path "/"
    assert_text "Welcome to Pine!"
  end
end
