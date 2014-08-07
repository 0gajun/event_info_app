class PublicEventInfos < ActiveRecord::Base
	def self.rebuild
		@eventinfos = EventInfo.where(pending_rebuild: true)
	    @eventinfos.each do | event |
	    	if (@public_event = PublicEventInfos.find_by(event_id: event[:id])).nil?
	      	@public_event = PublicEventInfos.new
	      	@public_event[:event_id] = event[:id]
	    	end
	      @public_event[:title] = event[:title]
	      @public_event[:placeid] = event[:placeid]
	      @public_event[:subplace] = event[:subplace]
	      @public_event[:categoryid] = event[:categoryid]
	      @public_event[:firstday_time] = event[:firstday_time]
	      @public_event[:secondday_time] = event[:secondday_time]
	      @public_event[:description] = event[:description]
	      @public_event[:image_url] = event[:image_url]
	      @public_event[:movie_url] = event[:movie_url]
	      @public_event[:group] = User.find(event[:userid])[:group]
	  		@public_event.save
	  		event[:pending_rebuild] = false
	  		event.save
	    end
	end
end
