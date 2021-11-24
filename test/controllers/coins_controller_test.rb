require "test_helper"

class CoinsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get coins_show_url
    assert_response :success
  end
end
