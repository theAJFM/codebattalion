require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "should get view" do
    get :view
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
