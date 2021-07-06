require 'test_helper'

class StaysControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get stays_index_url
    assert_response :success
  end

  test "should get show" do
    get stays_show_url
    assert_response :success
  end

  test "should get create" do
    get stays_create_url
    assert_response :success
  end

  test "should get new" do
    get stays_new_url
    assert_response :success
  end

  test "should get edit" do
    get stays_edit_url
    assert_response :success
  end

  test "should get update" do
    get stays_update_url
    assert_response :success
  end

  test "should get destroy" do
    get stays_destroy_url
    assert_response :success
  end

end
