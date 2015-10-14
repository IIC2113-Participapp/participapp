class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end


# Los métodos de los controladores relacionados con los usuarios, son generados por devise, y por defecto no
# están incluidos en el código, el uso correcto de la gema indica que solo se deben agregar los controladores al proyecto
# cuando sea necesario modificar alguno, dado que hasta este punto no necesitamos hacer ningún cambio no se agregarán todos
# controladores, que a pesar de no estar explicitamente en el proyecto son una parte escencial del funcionamiento de
# la aplicación.
#
# Por esta razón se agrega en este mismo directorio el archivo ./../controllers/userManager.txt, que indica la funcionalidad
# de cada método junto con sus pre y postcondiciones.
