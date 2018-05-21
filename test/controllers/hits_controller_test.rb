require 'test_helper'

class HitsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get hits_index_url
    assert_response :success
  end

end
