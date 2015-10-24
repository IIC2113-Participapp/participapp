# == Schema Information
#
# Table name: forums
#
#  id          :integer          not null, primary key
#  description :string
#  content_id  :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  name        :string
#

require 'test_helper'

class ForumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
