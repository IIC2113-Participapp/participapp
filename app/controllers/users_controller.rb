class UsersController < ApplicationController
  before_action :authenticate
  before_action :authorize_admin
  before_action :set_user, only: [:destroy, :toggle_admin, :toggle_editor]

  # GET /users(.:format)
  # - Muestra todos los usuarios de la aplicacion.
  def index
    @users = User.all
  end

  # PUT /toggle_admin(.:format)
  # - Asciende a un usuario al rango de administrador (o lo desciende).
  # - Pre-condiciones: en la tabla "users", el campo "admin" correspondiente
  # al usuario en cuestión tiene un valor "false" ("true").
  # - Post-condiciones: en la tabla "users", el campo "admin" correspondiente
  # al usuario en cuestión tiene un valor "true" ("false").
  def toggle_admin
    if @user then @user.toggle_admin else error_flash end
    redirect_to users_path
  end

  # PUT /toggle_editor(.:format)
  # - Asciende a un usuario al rango de editor (o lo desciende).
  # - Pre-condiciones: en la tabla "users", el campo "editor" correspondiente
  # al usuario en cuestión tiene un valor "false" ("true").
  # - Post-condiciones: en la tabla "users", el campo "editor" correspondiente
  # al usuario en cuestión tiene un valor "true" ("false").
  def toggle_editor
    if @user then @user.toggle_editor else error_flash end
    redirect_to users_path
  end

  # DELETE /user/:id(.:format)
  # - Elimina de la base de datos la entrada correspondiente al user en
  # cuestion. Recibe en la HTTP Request el parametro "id" de este usuario.
  # - Pre-condiciones: la tabla "users" cuenta con una entrada
  # correspondiente al "id" del user que se recibio como parametro.
  # - Post-condiciones: la tabla "userss" no cuenta con una entrada
  # correspondiente al "id" del user que se recibio como parametro.
  def destroy
    if @user then @user.destroy else error_flash end
    redirect_to users_path
  end

  private
    def error_flash
      flash[:danger] = "No se encontró el usuario. Inténtalo nuevamente."
    end

    def set_user
      @user = User.find(params[:id])
    end
end
