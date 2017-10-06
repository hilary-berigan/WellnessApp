require 'test_helper'

class TestHtmlControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get test_html_index_url
    assert_response :success
  end

end
