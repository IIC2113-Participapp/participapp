class UsersController < ApplicationController
  before_action :authenticate
  before_action :authorize_admin
  before_action :set_user, only: [:destroy, :toggle_admin, :toggle_editor]

  def index
    @users = User.all
  end

  def toggle_admin
    if @user then @user.toggle_admin else error_flash end
    redirect_to users_path
  end

  def toggle_editor
    if @user then @user.toggle_editor else error_flash end
    redirect_to users_path
  end

  def destroy
    if @user then @user.destroy else error_flash end
    redirect_to users_path
  end

  private
    def error_flash
      flash[:danger] = "No se encontró el usuario. Inténtalo nuevamente."
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
end
