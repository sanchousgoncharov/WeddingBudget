require "test_helper"

class CalculationsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get calculations_create_url
    assert_response :success
  end

  test "should get update" do
    get calculations_update_url
    assert_response :success
  end

  test "should get destroy" do
    get calculations_destroy_url
    assert_response :success
  end

  test "should get index" do
    get calculations_index_url
    assert_response :success
  end

  test "should get show" do
    get calculations_show_url
    assert_response :success
  end
end
