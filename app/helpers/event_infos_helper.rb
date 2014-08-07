module EventInfosHelper
	def event_of_current_user
		EventInfo.where(userid: current_user.id).first
	end

	def count_new_update_waiting_rebuild
		EventInfo.where(pending_rebuild: true).count
	end
	def count_delete_waiting_rebuild
		UpdatesEventinfo.where(delete_flag: true, revision: CurrentRevisions.current_eventinfo_revision+1).count
	end
end
