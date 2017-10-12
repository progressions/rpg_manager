# == Schema Information
#
# Table name: encounters
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  private    :boolean
#

require 'test_helper'

class EncounterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
