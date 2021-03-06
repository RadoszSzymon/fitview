class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:name, :avatar, :goals, :surname, :email, :password, :password_confirmation, :weight, :activity, :height, :age, :sex)
  end

  def account_update_params
    params.require(:user).permit(:name, :avatar, :goals,  :surname, :email, :password, :password_confirmation, :activity, :current_password, :weight, :height, :age, :sex)
  end
end