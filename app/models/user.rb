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
#  admin                  :boolean          default(FALSE)
#  editor                 :boolean
#  default                :string
#  false                  :string
#  first_name             :string
#  last_name              :string
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

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
end


# Los métodos de los controladores relacionados con los usuarios, son generados por devise, y por defecto no
# están incluidos en el código, el uso correcto de la gema indica que solo se deben agregar los controladores al proyecto
# cuando sea necesario modificar alguno, dado que hasta este punto no necesitamos hacer ningún cambio no se agregarán todos
# controladores, que a pesar de no estar explicitamente en el proyecto son una parte escencial del funcionamiento de
# la aplicación.
#
# Por esta razón se agrega en este mismo directorio el archivo ./../controllers/userManager.txt, que indica la funcionalidad
# de cada método junto con sus pre y postcondiciones.
