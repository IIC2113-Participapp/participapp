# == Schema Information
#
# Table name: contents
#
#  id                   :integer          not null, primary key
#  title                :string
#  body                 :text
#  authorization_status :string
#  user_id              :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  category_id          :integer
#

require 'test_helper'

class ContentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
