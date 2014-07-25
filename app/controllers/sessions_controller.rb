class SessionsController < ApplicationController

	def new
				
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			sign_in user
			redirect_to my_page_path
		else
			flash.now[:danger] = "メールアドレスとパスワードの組み合わせが間違っています"
			render 'new'
		end
	end

end
