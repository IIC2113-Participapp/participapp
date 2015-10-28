# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string
#  last_name              :string
#  admin                  :boolean          default(FALSE)
#  editor                 :boolean          default(FALSE)
#  periodicity            :integer
#  last_received          :datetime
#

class User < ActiveRecord::Base
  before_create :set_last_received_to_now

  # Include default devise modules. Others available are:
  # :recoverable, :trackable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable, :rememberable

  has_many :category_users, dependent: :destroy
  has_many :categories, through: :category_users

  validates :email, presence: true,
                    uniqueness: true

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
          .joins('JOIN contents ON category_users.category_id = contents.category_id')
          .where('contents.authorization_status' => 'authorized')
          .where('julianday() - julianday(users.last_received) >= users.periodicity')
          .select('users.id AS receiver_id, contents.*')
          .order('receiver_id')
  end

  private

    def set_last_received_to_now
      self.last_received = Time.now
    end

    def proper_periodicity
      errors.add(:periodicity, "la periodicidad ingresada es inválida.") unless [1, 2, 5, 7, 10, 14].include?(periodicity)
    end
end


# Los métodos de los controladores relacionados con los usuarios, son generados por devise, y por defecto no
# están incluidos en el código, el uso correcto de la gema indica que solo se deben agregar los controladores al proyecto
# cuando sea necesario modificar alguno, dado que hasta este punto no necesitamos hacer ningún cambio no se agregarán todos
# controladores, que a pesar de no estar explicitamente en el proyecto son una parte escencial del funcionamiento de
# la aplicación.
#
# Por esta razón se agrega en este mismo directorio el archivo ./../controllers/userManager.txt, que indica la funcionalidad
# de cada método junto con sus pre y postcondiciones.
