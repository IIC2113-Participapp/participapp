# == Schema Information
#
# Table name: contents
#
#  id                   :integer          not null, primary key
#  title                :string
#  body                 :text
#  authorization_status :string
#  user_id              :integer
#  category_id          :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

# Modela una noticia del la Reforma Tributaria.
class Content < ActiveRecord::Base

  # - Agrega metodo "author".
  # - Pre-condición: ninguna.
  # - Post-condición: retorna el User al que pertenece un Content.
  belongs_to :author, class_name: "User", foreign_key: "user_id"

  # - Agrega metodo "category".
  # - Pre-condición: ninguna.
  # - Post-condición: retorna la Category a la que pertenece un Content.
  belongs_to :category

  scope :authorized, -> { where(authorization_status: 'authorized') }
  scope :rejected, -> { where(authorization_status: 'rejected') }
  scope :pending, -> { where(authorization_status: 'pending') }

  validates :author, presence: true
  validates :category, presence: true
  validates :title, presence: true
  validates :body, presence: true

  # - Cambia el "authorization_status" de una instancia de content a "status".
  # - Pre-condición: el "status" de esta instancia tiene el valor "por aprobar".
  # - Post-condición: el "status" de esta instancia tiene el valor "aprobado" o
  # "rechazado".
  def change_status status
  end

  # - Retorna el content que corresponde enviarle al usuario que recibe como
  # parámetro.
  # - Pre-condición: ninguna
  # - Post-condición: ninguna
  def self.info_fetcher user
  end
end
