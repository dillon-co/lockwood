require 'test_helper'

class SiteStyleControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get site_style_new_url
    assert_response :success
  end

  test "should get edit" do
    get site_style_edit_url
    assert_response :success
  end

end
