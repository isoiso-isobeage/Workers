require "test_helper"

class SiteUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get site_users_index_url
    assert_response :success
  end

  test "should get add" do
    get site_users_add_url
    assert_response :success
  end
end
