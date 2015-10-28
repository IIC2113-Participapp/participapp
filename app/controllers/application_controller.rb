class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate
    unless user_signed_in?
      flash[:danger] = "Debes iniciar sesión para realizar esto."
      redirect_to root_path
    end
  end

  def authorize_admin
    unless current_user.admin?
      flash[:danger] = "No tienes permiso para realizar esto."
      redirect_to root_path
    end
  end

  def authorize_editor
    unless current_user.editor?
      flash[:danger] = "No tienes permiso para realizar esto."
      redirect_to root_path
    end
  end
end
