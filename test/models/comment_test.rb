# == Schema Information
#
# Table name: comments
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  content        :text
#  published_time :datetime
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  forum_id       :integer
#

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
