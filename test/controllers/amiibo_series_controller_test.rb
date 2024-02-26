require "test_helper"

class AmiiboSeriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get amiibo_series_index_url
    assert_response :success
  end

  test "should get show" do
    get amiibo_series_show_url
    assert_response :success
  end
end
