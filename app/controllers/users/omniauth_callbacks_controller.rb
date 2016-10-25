class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
	def vkontakte
		@user = User.from_omniauth(request.env["omniauth.auth"])
		sign_in @user
		redirect_to root_url
	end
end