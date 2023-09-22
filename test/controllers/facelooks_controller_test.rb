require "test_helper"

class FacelooksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get facelooks_index_url
    assert_response :success
  end
end
