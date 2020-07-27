# frozen_string_literal: true

require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "routes" do
    assert_routing '/login', controller: 'sessions', action: 'new'
    assert_routing({ method: 'delete', path: '/logout' }, { controller: 'sessions', action: 'destroy' })
  end

  test 'get the login form' do
    get login_path

    assert_response :success
  end

  test 'get the login form while logged in' do
    login_as users(:john)

    get login_url

    assert_redirected_to root_path
  end

  test 'logging in' do
    user = users(:john)
    post login_url, params: {
      user: {
        email: user.email,
        password: default_password
      }
    }

    assert_redirected_to root_path
    assert_equal user.id, session[:user_id]
  end

  test 'logging in with honeypot filled in' do
    user = users(:john)
    post login_url, params: {
      username: 'john',
      user: {
        email: user.email,
        password: default_password,
      }
    }

    assert_response :bad_request
  end

  test 'logging out' do
    login_as users(:john)

    delete logout_url

    assert_nil session[:user_id]
    assert_redirected_to root_path
  end
end
