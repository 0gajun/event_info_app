class EventInfosController < ApplicationController
	before_action :signed_in_user
	before_action :correct_user, only: [:show, :edit, :update]
  before_action :admin_user, only: [:new, :create, :approve, :reject, :rebuild]

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
  	@eventinfos = EventInfo.all.order('id asc')
  end

  def approve
    @eventinfo = EventInfo.find(params[:id])
    @eventinfo[:pending_approval] = false
    @eventinfo[:pending_rebuild] = true
    @eventinfo[:reject_message] = ""
    @eventinfo.save
    flash.now[:success] = "承認されました"
    render 'edit'
  end

  def reject
    @eventinfo = EventInfo.find(params[:id])
    @eventinfo[:pending_approval] = false
    @eventinfo[:reject_status] = true
    #リジェクトメッセージ未実装。 
    @eventinfo.save
    flash.now[:success] = "却下されました"
    render 'edit'  
  end

  def rebuild
    PublicEventInfos.rebuild
    redirect_to event_infos_path, :flash => { :success => "再構築が完了しました。" }
  end

  private
  	def eventinfo_params
  		params.require(:event_info).permit(:title, :categoryid, :placeid,
  											:subplace, :description, :userid, :image_url)
  	end

  	def correct_user
  		@eventinfo = EventInfo.find(params[:id])
  		unless @eventinfo.userid == current_user.id || current_user.admin?
  			redirect_to root_path
  		end
  	end
end
