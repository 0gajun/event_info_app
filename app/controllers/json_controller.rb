class JsonController < ApplicationController
  def show
  end

  def event_table_api
  	@event_info = PublicEventInfos.all
  	parse_revision
  end
  def description_table_api
  	@event_info = PublicEventInfos.all
  	parse_revision
  end

  private
  	def parse_revision
  		updates = UpdatesEventinfo.all
	  	@revisions = Hash.new
	  	updates.each do |update|
	  		rev = update[:revision]
	  		unless @revisions.has_key?(rev)
	  			@revisions[rev] = Hash.new
	  			@revisions[rev][:new] = Array.new
	  			@revisions[rev][:update] = Array.new
	  			@revisions[rev][:delete] = Array.new
	  		end

	  		if update[:update_flag]
	  			@revisions[rev][:update].push(update[:event_id])
	  		elsif update[:new_flag]
	  			@revisions[rev][:new].push(update[:event_id])
			elsif update[:delete_flag]
				@revisions[rev][:delete].push(update[:event_id])
			end
	  	end
  	end
end
