require "test_helper"

class BowlingCentersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bowling_center = bowling_centers(:one)
  end

  test "should get index" do
    get bowling_centers_url
    assert_response :success
  end

  test "should get new" do
    get new_bowling_center_url
    assert_response :success
  end

  test "should create bowling_center" do
    assert_difference('BowlingCenter.count') do
      post bowling_centers_url, params: { bowling_center: {} }
    end

    assert_redirected_to bowling_center_url(BowlingCenter.last)
  end

  test "should show bowling_center" do
    get bowling_center_url(@bowling_center)
    assert_response :success
  end

  test "should get edit" do
    get edit_bowling_center_url(@bowling_center)
    assert_response :success
  end

  test "should update bowling_center" do
    patch bowling_center_url(@bowling_center), params: { bowling_center: {} }
    assert_redirected_to bowling_center_url(@bowling_center)
  end

  test "should destroy bowling_center" do
    assert_difference('BowlingCenter.count', -1) do
      delete bowling_center_url(@bowling_center)
    end

    assert_redirected_to bowling_centers_url
  end
end
