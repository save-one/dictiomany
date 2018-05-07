require 'test_helper'

class MeaningsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get meanings_show_url
    assert_response :success
  end

end
