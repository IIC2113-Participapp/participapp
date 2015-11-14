# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  email               :string           default(""), not null
#  encrypted_password  :string           default(""), not null
#  remember_created_at :datetime
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  editor              :boolean          default(FALSE)
#  first_name          :string
#  last_name           :string
#  admin               :boolean          default(FALSE)
#  periodicity         :integer
#  last_received       :datetime
#

# Modela usuarios.
class User < ActiveRecord::Base
  before_create :set_last_received_to_one_month_ago

  # Include default devise modules. Others available are:
  # :recoverable, :trackable, :confirmable, :lockable,
  # :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable, :rememberable

  has_many :category_users, dependent: :destroy
  has_many :categories, through: :category_users
  has_many :forums

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validate :proper_periodicity, on: :update

  def full_name
    "#{first_name} #{last_name}"
  end

  def toggle_admin
    toggle!(:admin)
  end

  def toggle_editor
    toggle!(:editor)
  end

  def admin?
    return admin
  end

  def editor?
    return editor
  end

  def self.fetch_for_mailing
    return joins(:category_users)
          .joins('JOIN contents ON category_users.category_id = '\
                 'contents.category_id')
          .where('contents.authorization_status' => 'authorized')
          .where('julianday(users.last_received) < '\
                 'julianday(contents.created_at)')
          .where('julianday() - julianday(users.last_received)'\
                 '>= users.periodicity')
          .select('users.id AS receiver_id, contents.*')
          .order('receiver_id')
          .uniq
  end

  private

    def set_last_received_to_one_month_ago
      self.last_received = 30.days.ago
    end

    def proper_periodicity
      unless [1, 2, 5, 7, 10, 14].include?(periodicity)
        errors.add(:periodicity, "la periodicidad ingresada es inválida.")
      end
    end
end
