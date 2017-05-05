require 'test_helper'

class DonatorsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get donators_new_url
    assert_response :success
  end

end
