require 'test_helper'

class ExportsControllerTest < ActionDispatch::IntegrationTest
  test "should get main" do
    get exports_main_url
    assert_response :success
  end

end
