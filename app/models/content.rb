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
#

class Content < ActiveRecord::Base

  # Agrega metodo "user"
  # Pre-condición: Ninguna
  # Post-condición: Retorna el "user" al que pertenece un Content.
  belongs_to :user
end
