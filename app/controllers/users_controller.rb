class UsersController < ApplicationController
	before_action :signed_in_user, only: [:edit, :update, :show]
	before_action :correct_user, only: [:edit, :update]
	before_action :admin_user, only: [:index, :destroy]


	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "ユーザ（#{@user.name}）が作成されました"
			redirect_to create_user_path
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @user.update_attributes(user_params)
			flash[:success] = "ユーザ情報が更新されました"
			redirect_to my_page_path
		else
			render 'edit'
		end
	end

	def show
		@user = current_user
	end

	def index
		if user_lists_params[:user_list_target] == 'staff'
			@users = User.where(staff: true, admin: false).order('id asc')
			@title = 'スタッフ一覧'
		else
			@users = User.where(staff: false, admin: false).order('id asc')
			@title = 'ユーザ一覧'
		end
	end

	def destroy
		
	end

	private 
		def user_params
			params.require(:user).permit(:name, :email, :group,
											:password, :password_confirmation)
		end

		def user_lists_params
			return Hash[user_list_target: 'user'] unless params[:user_list_target].present?
			params.permit("user_list_target")
		end

		def signed_in_user
			if !signed_in?
				store_location
				flash.now[:warning] = "ログインしてください"
				redirect_to root_path
			end
		end

		def correct_user
			@user = User.find(params[:id])
			if !current_user?(@user) && !current_user.admin?
				flash[:warning] = "権限がありません"
				redirect_to(root_path)
			end
		end

		def admin_user
			unless current_user.admin?
				flash[:warning] = "権限がありません"
				redirect_to(root_path)
			end
		end

end