class PlacesController < ApplicationController
  before_action :signed_in_user
  before_action :admin_user

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    if @place.save
      update_revision
      flash[:success] = "作成されました"
      redirect_to edit_place_path(@place)
    else
      render 'new'
    end
  end

  def edit
    @place = Place.find(params[:id])
  end

  def update
    @place = Place.find(params[:id])
    if @place.update_attributes(place_params)
      update_revision
      flash[:success] = "更新されました"
      redirect_to edit_place_path(@place)
    else
      render 'edit'
    end
  end

  def index
    @places = Place.all
  end

  def destroy
    Place.find(params[:id]).destroy.save
    update_revision
    redirect_to places_path, :flash => { success: "削除しました" }
  end

  private
    def place_params
      params.require(:place).permit(:id, :name)
    end

    def update_revision
      revision = CurrentRevisions.find_by(table_name: "places")
      revision[:revision] = revision[:revision] + 1
      revision.save
    end
end
