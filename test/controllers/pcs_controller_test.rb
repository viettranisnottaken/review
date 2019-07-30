require 'test_helper'

class PcsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pcs_index_url
    assert_response :success
  end

  test "should get show" do
    get pcs_show_url
    assert_response :success
  end

end
