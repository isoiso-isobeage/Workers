require "test_helper"

class WorksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get works_new_url
    assert_response :success
  end

  test "should get show" do
    get works_show_url
    assert_response :success
  end

  test "should get edit" do
    get works_edit_url
    assert_response :success
  end
end
