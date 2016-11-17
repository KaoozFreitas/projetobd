require 'test_helper'

class FuncionariosControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get funcionarios_new_url
    assert_response :success
  end

end
