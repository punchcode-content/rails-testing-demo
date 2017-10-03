require 'test_helper'

class NotesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "root url should get index" do
    get '/'
    assert_response :success
    assert_equal 'notes', @controller.controller_name
    assert_equal 'index', @controller.action_name
  end
end
