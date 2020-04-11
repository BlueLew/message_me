require 'test_helper'

class ChatroomControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get chatroom_index_url
    assert_response :success
  end

  test "should get show" do
    get chatroom_show_url
    assert_response :success
  end

  test "should get edit" do
    get chatroom_edit_url
    assert_response :success
  end

  test "should get delete" do
    get chatroom_delete_url
    assert_response :success
  end

end
