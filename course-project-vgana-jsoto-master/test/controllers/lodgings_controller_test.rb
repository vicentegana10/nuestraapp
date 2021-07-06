require 'test_helper'

class LodgingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lodgings_index_url
    assert_response :success
  end

  test "should get show" do
    get lodgings_show_url
    assert_response :success
  end

  test "should get create" do
    get lodgings_create_url
    assert_response :success
  end

  test "should get new" do
    get lodgings_new_url
    assert_response :success
  end

  test "should get edit" do
    get lodgings_edit_url
    assert_response :success
  end

  test "should get update" do
    get lodgings_update_url
    assert_response :success
  end

  test "should get destroy" do
    get lodgings_destroy_url
    assert_response :success
  end

end
