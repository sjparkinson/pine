require 'test_helper'

class IndexControllerTest < ActionDispatch::IntegrationTest
  test "routes" do
    assert_routing '/', controller: 'index', action: 'index'
    assert_routing '/healthz', controller: 'index', action: 'healthz'
  end

  test "index#index" do
    get root_path
    assert_response :success
  end

  test "index#healthz" do
    get root_path
    assert_response :success
  end

  test "index#error" do
    [ 404, 422, 500, 503 ].each do |code|
      get "/#{code}"
      assert_response code
    end
  end
end
