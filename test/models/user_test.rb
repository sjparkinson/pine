require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = User.new
  end

  test "applies auto_strip_attributes" do
    @user.display_name = " John Doe\t"
    @user.email = " lkjh@example.com  "
    @user.validate

    assert_equal "John Doe", @user.display_name
    assert_equal "lkjh@example.com", @user.email
  end

  test "requires an email" do
    assert_not @user.valid?
    assert_includes @user.errors.details[:email].map{ |error| error[:error] }, :blank
  end

  test "requires a unique email" do
    @user.email = 'asdf@example.com'

    assert_not @user.valid?
    assert_includes @user.errors.details[:email].map{ |error| error[:error] }, :taken
  end

  test "requires a password to have a minimum length" do
    @user.password = 'asdf'

    assert_not @user.valid?
    assert_includes @user.errors.details[:password].map{ |error| error[:error] }, :too_short
  end

  test "requires a display name" do
    assert_not @user.valid?
    assert_includes @user.errors.details[:display_name].map{ |error| error[:error] }, :blank
  end
end
