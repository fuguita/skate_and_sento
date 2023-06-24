require "test_helper"

class Admin::ParkReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_park_reviews_index_url
    assert_response :success
  end
end
