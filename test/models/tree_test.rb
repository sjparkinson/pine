require 'test_helper'

class TreeTest < ActiveSupport::TestCase
  setup do
    @tree = Tree.new
  end

  test "applies auto_strip_attributes" do
    @tree.common_name = " Black Walnut\t"
    @tree.scientific_name = " Juglans nigra  "
    @tree.validate

    assert_equal "Black Walnut", @tree.common_name
    assert_equal "Juglans nigra", @tree.scientific_name
  end

  test "requires an common name" do
    assert_not @tree.valid?
    assert_includes @tree.errors.details[:common_name].map{ |error| error[:error] }, :blank
  end

  test "requires a user association" do
    assert_not @tree.valid?
    assert_includes @tree.errors.details[:user].map{ |error| error[:error] }, :blank
  end
end
