require 'test_helper'

class UsersSignupTestTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "invalid signup information" do
    get signup_path
    # before_count = User.count
    assert_no_difference 'User.count' do
      post users_path, user: {name: "",
                              email: "this_is@invalid",
                              password: "asdasd",
                              password_confirmation: "lasda"
      }
    end
    # after_count = User.count
    # assert_equal after_count, before_count
    assert_template 'users/new'
  end

  test "valid signup information" do
    get signup_path
    # before_count = User.count
    assert_difference 'User.count', 1 do
      post users_path, user: {name: "Example User",
                              email: "user@ex.com",
                              password: "password",
                              password_confirmation: "password"
      }
    end
    # follow_redirect!
    user = assigns(:user)
    # debugger
    log_in_as user
    assert is_logged_in?
    follow_redirect!
    assert_template 'users/show'
  end
end
