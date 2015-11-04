class RegistrationsController < Devise::RegistrationsController

	private

	def sign_up_params
		params.require(:user).permit(:name, :email, :password, :pasword_confirmation)
	end

	def account_update_params
		params.require(:user).permit(:name, :email, :pasword, :pasword_confirmation, :current_pasword)
	end

end