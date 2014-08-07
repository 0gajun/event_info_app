class CurrentRevisions < ActiveRecord::Base
	def self.current_eventinfo_revision
		CurrentRevisions.find_by(table_name: "event_infos")[:revision]
	end

	def self.eventinfo_rebuild
		revision = CurrentRevisions.find_by(table_name: "event_infos")
		revision[:revision] = revision[:revision] + 1
		revision.save
	end
end
