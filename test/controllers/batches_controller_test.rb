require 'test_helper'

class BatchesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get showbatchtt" do
    get :showbatchtt
    assert_response :success
  end

end
