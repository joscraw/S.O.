require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  setup do

  end


  test "should get index" do
    get root_url
    assert_select 'a.new-note', 'New Note'
    assert_response :success
  end

end