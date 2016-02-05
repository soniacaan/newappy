require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get contact" do
    get :contact
    assert_response :success
  end

  test "should get resume" do
    get :resume
    assert_response :success
  end

end
