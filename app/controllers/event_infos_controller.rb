class EventInfosController < ApplicationController
	before_action :signed_in_user
	before_action :correct_user, only: [:show, :edit, :update]
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
  	if @eventinfo.update_attributes(eventinfo_params)
  		flash[:success] = "企画#{@eventinfo.title}が更新されました"
  		redirect_to edit_event_info_path(@eventinfo)
  	else
  		render 'edit'
  	end
  end

  def show
  end

  def index
  	@eventinfos = EventInfo.all
  end

  private
  	def eventinfo_params
  		params.require(:event_info).permit(:title, :categoryid, :placeid,
  											:sub_placeid, :description, :userid, :image_url)
  	end

  	def correct_user
  		@eventinfo = EventInfo.find(params[:id])
  		unless @eventinfo.userid == current_user.id || current_user.admin?
  			redirect_to root_path
  		end
  	end
end
