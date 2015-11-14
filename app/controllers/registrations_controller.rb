# RegistrationsController < Devise::RegistrationsController
#
# + update
# - sign_up_params
# - account_update_params
#
class RegistrationsController < Devise::RegistrationsController

  def update
    super

    CategoryUser.where(user_id: current_user.id).delete_all
    if params[:user][:category_ids]
      cat_ids = params[:user][:category_ids].uniq

      cat_ids.each do |id|
        category = Category.find_by(id: id)
        @user.categories << category if category
      end
    end
  end

  private

    def sign_up_params
      params.require(:user).permit(:first_name, :last_name, :email, :password,
                                   :password_confirmation)
    end

    def account_update_params
      params.require(:user).permit(:first_name, :last_name, :email, :password,
                                   :password_confirmation, :current_password,
                                   :periodicity, :category_ids)
    end
end
