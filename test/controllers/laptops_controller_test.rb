require 'test_helper'

class LaptopsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get laptops_index_url
    assert_response :success
  end

  test "should get show" do
    get laptops_show_url
    assert_response :success
  end

end
