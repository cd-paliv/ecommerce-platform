require "test_helper"

class SaleItemControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get sale_item_create_url
    assert_response :success
  end
end
