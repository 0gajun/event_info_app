module UsersHelper
	def currentuser_admin?
		current_user.admin?
	end
end