# == Schema Information
#
# Table name: notes
#
#  id         :integer          not null, primary key
#  codename   :string           not null
#  body       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  test "requires a body" do
    note = Note.new(body: nil)
    assert !note.valid?
    assert !note.errors[:body].empty?
  end

  test "automatically assigns a codename" do
    note = Note.new(body: "test")
    assert note.codename.nil?
    assert note.valid?
    assert !note.codename.nil?, "expected a codename to be assigned"
  end

  test "does not overwrite current codename" do
    note = Note.new(codename: "test")
    note.valid?
    assert_equal note.codename, "test"
  end

  test "codenames must be unique" do
    note = Note.new(codename: "test", body: "test")
    assert note.save

    note2 = Note.new(codename: "test", body: "test")
    assert !note2.valid?
    assert !note2.errors[:codename].empty?
  end

  test "assigns unique codenames" do
    note = Note.new
    note.valid?

    note2 = Note.new
    note2.valid?

    # assert note.codename != note2.codename
    refute_equal note.codename, note2.codename
  end
end
