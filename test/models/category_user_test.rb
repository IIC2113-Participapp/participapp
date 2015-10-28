# == Schema Information
#
# Table name: category_users
#
#  id          :integer          not null, primary key
#  category_id :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class CategoryUserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
