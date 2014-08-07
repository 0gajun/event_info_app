class JsonController < ApplicationController
  def show
  end

  def event_table_api
  	@event_info = PublicEventInfos.all
  end
  def description_table_api
  	@event_info = PublicEventInfos.all
  end
end
