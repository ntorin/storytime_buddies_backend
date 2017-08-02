require 'test_helper'

class LobbyMessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lobby_message = lobby_messages(:one)
  end

  test "should get index" do
    get lobby_messages_url
    assert_response :success
  end

  test "should get new" do
    get new_lobby_message_url
    assert_response :success
  end

  test "should create lobby_message" do
    assert_difference('LobbyMessage.count') do
      post lobby_messages_url, params: { lobby_message: { lobby_id: @lobby_message.lobby_id, message: @lobby_message.message, user_id: @lobby_message.user_id } }
    end

    assert_redirected_to lobby_message_url(LobbyMessage.last)
  end

  test "should show lobby_message" do
    get lobby_message_url(@lobby_message)
    assert_response :success
  end

  test "should get edit" do
    get edit_lobby_message_url(@lobby_message)
    assert_response :success
  end

  test "should update lobby_message" do
    patch lobby_message_url(@lobby_message), params: { lobby_message: { lobby_id: @lobby_message.lobby_id, message: @lobby_message.message, user_id: @lobby_message.user_id } }
    assert_redirected_to lobby_message_url(@lobby_message)
  end

  test "should destroy lobby_message" do
    assert_difference('LobbyMessage.count', -1) do
      delete lobby_message_url(@lobby_message)
    end

    assert_redirected_to lobby_messages_url
  end
end
