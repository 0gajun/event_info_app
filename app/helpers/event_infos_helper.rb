module EventInfosHelper
	def event_of_current_user
		EventInfo.where(userid: current_user.id).first
	end
end
