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

class Note < ApplicationRecord
  before_validation :assign_codename

  validates_presence_of :body
  validates_presence_of :codename

  validates_uniqueness_of :codename

  def assign_codename
    return unless self.codename.blank?
    self.codename = Haikunator.haikunate
  end
end
