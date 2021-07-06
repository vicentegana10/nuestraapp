require 'test_helper'

class MailboxControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mailbox_index_url
    assert_response :success
  end

  test "should get show" do
    get mailbox_show_url
    assert_response :success
  end

  test "should get create" do
    get mailbox_create_url
    assert_response :success
  end

  test "should get new" do
    get mailbox_new_url
    assert_response :success
  end

  test "should get edit" do
    get mailbox_edit_url
    assert_response :success
  end

  test "should get update" do
    get mailbox_update_url
    assert_response :success
  end

  test "should get destroy" do
    get mailbox_destroy_url
    assert_response :success
  end

end
