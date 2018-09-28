class ApplicationController < ActionController::Base
protect_from_forgery with: :exception
before_action :configure_permitted_parameters, if: :devise_controller?

	private

	def after_sign_in_path_for(resource)
		user_path(resource)
	end

	def  after_sign_out_path_for(resource)
		root_path
	end



	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile_image, :email])
		devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
	end

	def current_user?(user)
		if current_user.nil?
			return false
		else
			user.id.equial?(current_user.id)
		end
	end
end
