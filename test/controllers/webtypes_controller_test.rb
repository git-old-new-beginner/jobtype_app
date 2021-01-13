require 'test_helper'

class WebtypesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get webtypes_index_url
    assert_response :success
  end

end
