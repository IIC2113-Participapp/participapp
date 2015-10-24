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

#Espacio de opinión para una noticia específica.
class Forum < ActiveRecord::Base
  # Relaciones entre un "Forum" y un "Content", "User" y "Comments"
  #
  #Cada foro está relacionado a una noticia específica.
  belongs_to :content
  #Cada foro se relaciona con un usuario, quien es el que lo creó.
  belongs_to :user
  #Un foro tendrá muchos commentarios sobre el tema en discusión.
  has_many :comments
end
