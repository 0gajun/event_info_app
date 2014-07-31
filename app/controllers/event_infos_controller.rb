class EventInfosController < ApplicationController
	before_action :signed_in_user
  before_action :admin_user, only: [:new, :create]

  def new
  	@eventinfo = EventInfo.new
  end

  def create
  	@eventinfo = EventInfo.new(eventinfo_params)
  	if @eventinfo.save
  		flash[:success] = "企画(#{@eventinfo.title})が作成されました"
  		redirect_to register_eventinfo_path
  	else
	  	render 'new'
  	end
  end

  def edit
  end
  def update
  	
  end

  def show
  end

  def index
  	
  end

  private
  	def eventinfo_params
  		params.require(:event_info).permit(:title, :categoryid, :placeid,
  											:sub_placeid, :description, :userid)
  	end
end
