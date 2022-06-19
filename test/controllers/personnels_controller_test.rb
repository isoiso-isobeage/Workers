require "test_helper"

class PersonnelsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get personnels_new_url
    assert_response :success
  end
end
