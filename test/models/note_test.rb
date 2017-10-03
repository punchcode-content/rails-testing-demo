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
end
