# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# Modela categorías de los contents (por ejemplo: "Medio Ambiente").
class Category < ActiveRecord::Base

  # - Agrega metodo "contents".
  # - Pre-condición: ninguna.
  # - Post-condición: retorna los "contents" relacionados a esta "category".
  has_many :contents

  validates :name, presence: true,
                   uniqueness: true
end
