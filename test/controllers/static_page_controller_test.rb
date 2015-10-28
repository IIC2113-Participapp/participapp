require 'test_helper'

class StaticPageControllerTest < ActionController::TestCase
  test "should get mailer_example" do
    get :mailer_example
    assert_response :success
  end

end
