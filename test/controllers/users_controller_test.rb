# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should get join' do
    get join_url
    assert_response :success
  end

  test 'should create user' do
    assert_difference('User.count') do
      post users_url, params: { user: { email: 'hjkl@example.com', display_name: 'Jane', password: default_password } }
    end

    assert_equal User.last.id, session[:user_id]
    assert_redirected_to root_path
  end

  test 'should require all fields' do
    assert_difference('User.count') do
      post users_url, params: { user: { email: 'hjkl@example.com', display_name: 'Jane', password: default_password } }
    end

    assert_equal User.last.id, session[:user_id]
    assert_redirected_to root_path
  end
end
