Refinery::PagesController.class_eval do
	before_filter :check_user_login

	def check_user_login
		if current_user.blank?
			redirect_to main_app.root_path
		end
	end
end