# == Schema Information
#
# Table name: party_memberships
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  encounter_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class PartyMembershipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
