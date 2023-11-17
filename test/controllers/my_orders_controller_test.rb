require "test_helper"

class MyOrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get my_orders_index_url
    assert_response :success
  end
end
