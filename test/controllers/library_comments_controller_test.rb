require 'test_helper'

class LibraryCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @library_comment = library_comments(:one)
  end

  test "should get index" do
    get library_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_library_comment_url
    assert_response :success
  end

  test "should create library_comment" do
    assert_difference('LibraryComment.count') do
      post library_comments_url, params: { library_comment: { comment: @library_comment.comment, likes: @library_comment.likes, story_id: @library_comment.story_id, user_id: @library_comment.user_id } }
    end

    assert_redirected_to library_comment_url(LibraryComment.last)
  end

  test "should show library_comment" do
    get library_comment_url(@library_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_library_comment_url(@library_comment)
    assert_response :success
  end

  test "should update library_comment" do
    patch library_comment_url(@library_comment), params: { library_comment: { comment: @library_comment.comment, likes: @library_comment.likes, story_id: @library_comment.story_id, user_id: @library_comment.user_id } }
    assert_redirected_to library_comment_url(@library_comment)
  end

  test "should destroy library_comment" do
    assert_difference('LibraryComment.count', -1) do
      delete library_comment_url(@library_comment)
    end

    assert_redirected_to library_comments_url
  end
end
