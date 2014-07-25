include ApplicationHelper

def sign_in(user, options={})
	if options[:no_capybara]
		remember_token = User.new_remember_token
    	cookies[:remember_token] = remember_token
    	user.update_attribute(:remember_token, User.encrypt(remember_token))
  	else
    	visit root_path
    	fill_in "メールアドレス",  	with: user.email
    	fill_in "パスワード",			with: user.password
    	click_button "ログイン"
  	end
end