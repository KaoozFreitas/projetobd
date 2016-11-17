require 'test_helper'

class PecasControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get pecas_new_url
    assert_response :success
  end

end
