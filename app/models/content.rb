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

  has_many :forums

  scope :authorized, -> { where(authorization_status: 'authorized') }
  scope :pending, -> { where(authorization_status: 'pending') }

  validates :author, presence: true
  validates :category, presence: true
  validates :title, presence: true
  validates :body, presence: true

  delegate :name, to: :category, prefix: true

  def change_auth_status status
    self.update_attribute(:authorization_status, status)
  end
end
