require 'test_helper'

class IndexControllerTest < ActionDispatch::IntegrationTest
  test "index#index" do
    get root_path
    assert_response :success
  end

  test "index#healthz" do
    get root_path
    assert_response :success
  end
end
