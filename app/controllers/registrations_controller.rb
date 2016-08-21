class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :weight, :height, :age, :sex)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :weight, :height, :age, :sex)
  end
end