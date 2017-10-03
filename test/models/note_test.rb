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
end
