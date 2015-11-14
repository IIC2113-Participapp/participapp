# == Schema Information
#
# Table name: forums
#
#  id          :integer          not null, primary key
#  description :text
#  content_id  :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  name        :string
#

# Espacio de opinión para una noticia específica.
class Forum < ActiveRecord::Base
  # Cada foro está relacionado a una noticia específica.
  belongs_to :content
  belongs_to :user
  has_many :comments

  validates :name, presence: true, uniqueness: true
end
