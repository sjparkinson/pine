require "application_system_test_case"

class IndexTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit root_path
    assert_selector "h1", text: "Welcome to Pine"
  end

  test "visiting healthz" do
    visit healthz_path
  end
end
