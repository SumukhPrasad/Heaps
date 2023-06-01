require "test_helper"

class HeapsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get heaps_show_url
    assert_response :success
  end

  test "should get edit" do
    get heaps_edit_url
    assert_response :success
  end
end
