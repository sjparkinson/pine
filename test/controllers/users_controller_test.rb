# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'routes' do
    assert_routing '/join', controller: 'users', action: 'new'
    assert_routing({ method: 'post', path: '/join' }, { controller: 'users', action: 'create' })
  end

  test 'should get join' do
    get join_url
    assert_response :success
  end

  test 'should create user' do
    assert_difference('User.count') do
      post join_url, params: { user: { email: 'hjkl@example.com', display_name: 'Jane', password: default_password } }
    end

    assert_equal User.last.id, session[:user_id]
    assert_redirected_to root_path
  end

  test 'should require all fields on create' do
    assert_difference('User.count') do
      post join_url, params: { user: { email: 'hjkl@example.com', display_name: 'Jane', password: default_password } }
    end

    assert_equal User.last.id, session[:user_id]
    assert_redirected_to root_path
  end

  test 'should block with honeypot filled in on create' do
    post join_url, params: {
      user: {
        email: 'lkjh@example.com',
        display_name: 'Jane',
        password: default_password
      },
      password_confirm: default_password
    }

    assert_response :bad_request
  end

  test 'should show users their account details' do
    @user = users(:john)
    login_as @user

    get account_url

    assert_response :success
  end

  test 'should allow users to change their email' do
    @user = users(:john)
    login_as @user

    patch account_url, params: { user: { email: 'hjkl@example.com' } }

    assert_redirected_to account_path
  end

  test 'should allow users to change their display name' do
    @user = users(:john)
    login_as @user

    patch account_url, params: { user: { display_name: 'Joe' } }

    assert_redirected_to account_path
  end

  test 'should allow users to change their password' do
    @user = users(:john)
    login_as @user

    patch account_url, params: { user: { password: default_password } }

    assert_redirected_to account_path
  end
end
