class UsersController < ApplicationController
  before_action :authenticate
  before_action :authorize_admin
  before_action :set_user, only: [:destroy, :toggle_admin, :toggle_editor]

  def index
    @users = User.all
  end

  def toggle_admin
    @user.toggle_admin
    redirect_to users_path
  end

  def toggle_editor
    @user.toggle_editor
    redirect_to users_path
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
end
