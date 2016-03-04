require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get contact" do
    get :contact
    assert_response :success
    assert_select "title", "contact | Ideas Connect Us"

  end

  test "should get resume" do
    get :resume
    assert_response :success
    assert_select "title", "resume | Ideas Connect Us"

  end

end
