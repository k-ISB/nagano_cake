require 'test_helper'

class Public::EndUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_end_users_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_end_users_edit_url
    assert_response :success
  end

  test "should get update" do
    get public_end_users_update_url
    assert_response :success
  end

  test "should get delete_verification" do
    get public_end_users_delete_verification_url
    assert_response :success
  end

end
