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
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  belongs_to :category
  has_many :forums

  scope :authorized, -> { where(authorization_status: 'authorized') }
  scope :pending, -> { where(authorization_status: 'pending') }

  validates :author, presence: true
  validates :category, presence: true
  validates :title, presence: true, uniqueness: true
  validates :body, presence: true

  delegate :name, to: :category, prefix: true

  def change_auth_status status
    self.update_attribute(:authorization_status, status)
    self.update_attribute(:created_at, DateTime.now) if status == 'authorized'
  end
end
