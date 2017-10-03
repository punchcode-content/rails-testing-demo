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

  test "notes#delete should delete note" do
    note = notes(:one)
    delete note_url(note.id)
    assert_response :redirect
    assert_equal Note.where(id: note.id).count, 0
  end
end
