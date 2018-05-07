require 'test_helper'

class DictionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dictions_index_url
    assert_response :success
  end

  test "should get show" do
    get dictions_show_url
    assert_response :success
  end

end
