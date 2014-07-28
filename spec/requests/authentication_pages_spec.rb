require 'spec_helper'

describe "AuthenticationPages" do
  subject { page }

  describe "sign in page" do 
  	before { visit root_path }
  	it { expect(subject).to have_content('参加者ログイン') }
  end

  describe "sign in" do 
  	before { visit root_path }

  	describe "with invalid information" do 
  		before { click_button "ログイン" }

  		it { expect(subject).to have_content('参加者ログイン') }
  		it { expect(subject).to have_selector('div.alert.alert-danger', text: "間違っています") }
  		describe "after visiting another page" do 
  			before { click_link "矢上祭出展管理システム" }
  			it {expect(subject).not_to have_selector('div.alert.alert-danger') }
  		end
  	end
  	describe "with valid information" do 
  		let(:user) { FactoryGirl.create(:user) }
  		before { sign_in user }

  		it { expect(subject).to have_title(full_title('マイページ')) }
  		it { expect(subject).to have_link('ログアウト', href: signout_path) }
  		it { expect(subject).to have_link('マイページ', href: my_page_path) }
  		it { expect(subject).to have_link('ユーザ情報編集', href: edit_user_path(user) ) }

  		describe "followed by signout" do 
  			before { click_link 'ログアウト' }
  			it { expect have_content('参加者ログイン') }
  		end
  	end
  end

  describe "signed in user" do 
  	let(:user) { FactoryGirl.create(:user) }
  	before { sign_in user, no_capybara: true }

  	describe " when access to root_path" do 
  		before { get root_path }
  		specify { expect(response).to redirect_to(my_page_path) }
  	end
  end

  describe "authorization" do 
  	describe "for non-signed-in users" do
  		let(:user){ FactoryGirl.create(:user) } 
  		describe "in Users Controller" do 

  			describe "visiting edit user page" do 
  				before { visit edit_user_path(user) }
  				it { expect(subject).to have_content('参加者ログイン') }
  			end


  			describe "submitting to the update action" do 
  				before { patch user_path(user) }
  				specify { expect(response).to redirect_to( root_path )}
  			end

  			describe "when attempting to visit a protected page" do 
  				before do 
  					visit edit_user_path(user)
  					fill_in "メールアドレス", with: user.email
  					fill_in "パスワード", with: user.password
  					click_button "ログイン"
  				end
  				describe "after signing in" do 
  					it "render the desired page" do 
  						expect(subject).to have_title('ユーザ情報編集')
  					end
  				end
  			end

  		end
  	end

  	describe "wrong user" do 
  		let(:user) { FactoryGirl.create(:user) }
  		let(:wrong_user) { FactoryGirl.create(:user, email: "wrong@example.com") }
  		describe do
	  		before { sign_in user, no_capybara: true }

	  		describe "submitting a GET request to the user#index action" do 
	  			before { get users_path }
	  			specify { expect(response).to redirect_to(root_path) }
	  		end
	  		describe "submitting a GET request to the user#edit action" do 
	  			before { get edit_user_path(wrong_user) }
	  			specify { expect(response).to redirect_to(root_path) }
				end
				describe "submitting a PATCH request to the user#update action" do |variable|
					before { patch user_path(wrong_user) }
					specify { expect(response).to redirect_to(root_path) }
				end
			end
	  end

  	describe "admin user" do
  		let(:admin) { FactoryGirl.create(:admin) }
  		let(:user) { FactoryGirl.create(:user, email: "normal@example.com") }

  		describe "(with capybara)" do 
	  		before { sign_in admin }

	  		describe "visiting normal users path" do 
	  			before { visit users_path(user_list_target: 'user') }
	  			it { expect(subject).to have_title('ユーザ一覧') }
	  			it { expect(subject).not_to have_title('スタッフ一覧') }
	  		end
	  		describe "visiting staff users path" do 
	  			before { visit users_path(user_list_target: 'staff') }
	  			it { expect(subject).to have_title('スタッフ一覧') }
	  			it { expect(subject).not_to have_title('ユーザ一覧') }
	  		end
	  	end
  	end
  	describe "non-admin user" do 
  		let(:non_admin) { FactoryGirl.create(:user) }
  		before { sign_in non_admin }
  		describe "viisting users path" do 
  			before { visit users_path(user_list_target: 'user') }
  			it { expect(subject).to have_selector('div.alert.alert-warning', text: "権限がありません") }
  			it { expect(subject).to have_title(full_title('マイページ')) }
  		end
  		describe "visiting staff path" do 
  			before { visit users_path(user_list_target: 'staff') }
  			it { expect(subject).to have_selector('div.alert.alert-warning', text: "権限がありません") }
  			it { expect(subject).to have_title(full_title('マイページ')) }
  		end
  	end
  end
end
