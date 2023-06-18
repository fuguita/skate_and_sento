require "test_helper"

class Admin::PostTagsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_post_tags_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_post_tags_edit_url
    assert_response :success
  end
end
