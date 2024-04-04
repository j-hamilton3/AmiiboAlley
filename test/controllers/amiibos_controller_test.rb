require "test_helper"

class AmiibosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get amiibos_index_url
    assert_response :success
  end

  test "should get show" do
    get amiibos_show_url
    assert_response :success
  end
end
