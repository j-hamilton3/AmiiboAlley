require "test_helper"

class GameSeriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get game_series_index_url
    assert_response :success
  end

  test "should get show" do
    get game_series_show_url
    assert_response :success
  end
end
