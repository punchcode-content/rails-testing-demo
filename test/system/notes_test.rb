require "application_system_test_case"

class NotesTest < ApplicationSystemTestCase

  # test "visiting the index" do
  #   visit notes_url
  #
  #   assert_selector "h1", text: "Notes"
  # end

  test "creating a note" do
    visit "/"
    click_on "Create note"
    
    fill_in "Body", with: "System test note"
    click_on "Create new note"

    assert_text "System test note"
  end

  test "deleting a note" do
    visit "/"
    assert_text notes(:one).body
    assert_selector "#note-#{notes(:one).id}"

    within "#note-#{notes(:one).id}" do
      click_on "Delete"
    end

    assert_no_selector "#note-#{notes(:one).id}"
  end
end
