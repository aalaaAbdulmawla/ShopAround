require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get Account" do
    get :Account
    assert_response :success
  end

end
