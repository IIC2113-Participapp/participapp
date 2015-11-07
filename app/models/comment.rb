# == Schema Information
#
# Table name: comments
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  content        :text
#  forum_id       :integer
#  published_time :datetime
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

# Modela comentarios de los foros.
class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :forum
end
