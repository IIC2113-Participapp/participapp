class RegistrationsController < Devise::RegistrationsController

  def update
    super
    if params[:user][:category_ids]
      CategoryUser.where(user_id: current_user.id).delete_all
      params[:user][:category_ids].each do |id|
        category = Category.find_by(id: id)
        @user.categories << category unless category.nil? || @user.categories.include?(category)
      end
    end
  end

  private

    def sign_up_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :major_ids)
    end

    def account_update_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
    end
end
