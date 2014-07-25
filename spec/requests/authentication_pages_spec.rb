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
  		before do 
  			fill_in "メールアドレス",		with: user.email.upcase
  			fill_in "パスワード",			with: user.password
  			click_button "ログイン"
  		end

  		it { expect(subject).to have_title(full_title('マイページ')) }
  		it { expect(subject).to have_link('ログアウト', href: signout_path) }
  		it { expect(subject).to have_link('マイページ', href: my_page_path) }
  	end
  end
end
