class CategoriesController < ApplicationController
  before_action :signed_in_user
  before_action :admin_user

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      update_revision
      flash[:success] = "作成されました"
      redirect_to edit_category_path(@category)
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      update_revision
      flash[:success] = "更新されました"
      redirect_to edit_category_path(@category)
    else
      render 'edit'
    end
  end

  def index
    @categories = Category.all
  end

  def destroy
    Category.find(params[:id]).destroy.save
    update_revision
    redirect_to categories_path, :flash => { success: "削除しました" }
  end

  private
    def category_params
      params.require(:category).permit(:id, :name)
    end

    def update_revision
      revision = CurrentRevisions.find_by(table_name: "categories")
      revision[:revision] = revision[:revision] + 1
      revision.save
    end

end
