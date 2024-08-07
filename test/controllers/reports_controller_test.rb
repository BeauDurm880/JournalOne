require "test_helper"

class ReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get day_rating" do
    get reports_day_rating_url
    assert_response :success
  end
end
