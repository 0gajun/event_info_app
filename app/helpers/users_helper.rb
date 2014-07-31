module UsersHelper
	def currentuser_admin?
		current_user.admin?
	end
	def signed_in_user
		if !signed_in?
			store_location
			flash.now[:warning] = "ログインしてください"
			redirect_to root_path
		end
	end

	def correct_user
		@user = User.find(params[:id])
		if !current_user?(@user) && !current_user.admin?
			flash[:warning] = "権限がありません"
			redirect_to(root_path)
		end
	end

	def admin_user
		unless current_user.admin?
			flash[:warning] = "権限がありません"
			redirect_to(root_path)
		end
	end
end