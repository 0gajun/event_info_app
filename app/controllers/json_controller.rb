class JsonController < ApplicationController
  def show
  end

  def event_table_api
  	@event_info = EventInfo.all
  end
end
