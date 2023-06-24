require "test_helper"

class Admin::SentoReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_sento_reviews_index_url
    assert_response :success
  end
end
