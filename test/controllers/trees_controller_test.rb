require 'test_helper'

class TreesControllerTest < ActionDispatch::IntegrationTest
  test "routes" do
    assert_routing '/trees', controller: 'trees', action: 'index'
    assert_routing '/trees/00000000-0000-0000-0000-000000000000', controller: 'trees', action: 'show', id: '00000000-0000-0000-0000-000000000000'
    assert_routing '/trees/00000000-0000-0000-0000-000000000000/edit', controller: 'trees', action: 'edit', id: '00000000-0000-0000-0000-000000000000'
    assert_routing '/trees/new', controller: 'trees', action: 'new'
    assert_routing({ method: 'post', path: '/trees' }, { controller: 'trees', action: 'create' })
    assert_routing({ method: 'patch', path: '/trees/00000000-0000-0000-0000-000000000000' }, { controller: 'trees', action: 'update', id: '00000000-0000-0000-0000-000000000000' })
    assert_routing({ method: 'delete', path: '/logout' }, { controller: 'sessions', action: 'destroy' })
  end

  setup do
    @tree = trees(:walnut)
    @user = users(:john)
    login_as @user
  end

  test "should get index" do
    get trees_url
    assert_response :success
  end

  test "should get new" do
    get new_tree_url
    assert_response :success
  end

  test "should create tree" do
    assert_difference('Tree.count') do
      post trees_url, params: { tree: { common_name: "Scotts Pine" } }
    end

    assert_redirected_to tree_url(Tree.last)
  end

  test "should redirect to url with slug on show tree" do
    get tree_url(@tree)
    assert_redirected_to tree_with_slug_url(@tree.common_name.parameterize, @tree)
  end

  test "should show tree" do
    get tree_with_slug_url(@tree.common_name.parameterize, @tree)
    assert_response :success
  end

  test "should get edit" do
    get edit_tree_url(@tree)
    assert_response :success
  end

  test "should update tree" do
    patch tree_url(@tree), params: { tree: { common_name: "Black Walnut" } }
    assert_redirected_to tree_url(@tree)
  end

  test "should destroy tree" do
    assert_difference('Tree.count', -1) do
      delete tree_url(@tree)
    end

    assert_redirected_to trees_url
  end
end
