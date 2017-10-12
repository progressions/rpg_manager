# == Schema Information
#
# Table name: messages
#
#  id           :integer          not null, primary key
#  body         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  encounter_id :integer
#  message_type :string
#  user_id      :integer
#

require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
