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

#Objeto que será agregado a un Foro.
class Comment < ActiveRecord::Base
  # Cada 'Comment' estará relacionado a un usuario.
  belongs_to :user
  # Cada 'Comment' será parte de un Foro específico
  belongs_to :forum

end
