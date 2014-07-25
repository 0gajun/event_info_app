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
end
